import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:brand_admin/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
import 'package:brand_admin/src/core/colors/colors.dart';
import 'package:brand_admin/src/core/service/injectable/injectable_service.dart';
import 'package:brand_admin/src/features/main/presentation/bloc/services_bloc.dart';
import 'package:brand_admin/src/features/main/data/models/task_model.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key, required this.lessonId, required this.groupId});
  final int lessonId;
  final int groupId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Тапсырмалар',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BaseBlocWidget<ServicesBloc, ServicesEvent, ServicesState>(
        bloc: getIt<ServicesBloc>(),
        starterEvent: ServicesEvent.getTasksEvent(lessonId, groupId),
        builder: (context, state, bloc) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            ),
            loadingError: (message) => Center(
              child: Container(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            success: (viewModel) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (viewModel.tasks != null)
                    ...viewModel.tasks!
                        .map((task) => _buildTaskWidget(task))
                        .toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskWidget(TaskModel task) {
    return Card(
      color: AppColors.white,
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.number != null)
              Text(
                'Тапсырма ${task.number}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
            const SizedBox(height: 8),
            _buildHtmlWithImages(task.content),
            const SizedBox(height: 16),

            _buildTaskTypeContent(task),
          ],
        ),
      ),
    );
  }

  Widget _buildHtmlWithImages(String htmlContent) {
    if (htmlContent.contains('<img')) {
      return Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._extractAndShowImages(context, htmlContent),
            Html(
              data: _removeImagesFromHtml(htmlContent),
              shrinkWrap: true,
              extensions: [_mathExtension()],
              style: {"*": Style(fontSize: FontSize(16))},
            ),
          ],
        ),
      );
    } else {
      return Html(
        data: htmlContent,
        shrinkWrap: true,
        extensions: [_mathExtension()],
        style: {"*": Style(fontSize: FontSize(16))},
      );
    }
  }

  List<Widget> _extractAndShowImages(BuildContext context, String htmlContent) {
    final List<Widget> imageWidgets = [];
    final RegExp imgRegex = RegExp(r'<img[^>]*>', caseSensitive: false);
    final matches = imgRegex.allMatches(htmlContent);

    for (final match in matches) {
      final imgTag = match.group(0)!;

      final srcRegex = RegExp(r'src="([^"]*)"', caseSensitive: false);
      final srcMatch = srcRegex.firstMatch(imgTag);
      final src = srcMatch?.group(1);

      final styleRegex = RegExp(r'style="([^"]*)"', caseSensitive: false);
      final styleMatch = styleRegex.firstMatch(imgTag);
      final style = styleMatch?.group(1);

      if (src != null && src.isNotEmpty) {
        double? width;
        double? height;

        if (style != null) {
          final widthRegex = RegExp(r'width:\s*(\d+)px');
          final heightRegex = RegExp(r'height:\s*(\d+)px');

          final widthMatch = widthRegex.firstMatch(style);
          final heightMatch = heightRegex.firstMatch(style);

          if (widthMatch != null) {
            width = double.tryParse(widthMatch.group(1)!);
          }
          if (heightMatch != null) {
            height = double.tryParse(heightMatch.group(1)!);
          }
        }

        imageWidgets.add(
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () => _showFullScreenImage(context, src),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: src,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                      errorWidget: (context, error, stackTrace) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            border: Border.all(color: Colors.red.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.error, color: Colors.red),
                              const SizedBox(height: 8),
                              const Text('Изображение не загружено'),
                              Text(
                                src,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                      progressIndicatorBuilder:
                          (context, child, loadingProgress) {
                            return Container(
                              height: height ?? 100,
                              width: width ?? double.infinity,
                              child: Center(child: CircularProgressIndicator()),
                            );
                          },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return imageWidgets;
  }

  String _removeImagesFromHtml(String htmlContent) {
    return htmlContent.replaceAll(
      RegExp(r'<img[^>]*>', caseSensitive: false),
      '',
    );
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _FullScreenImageViewer(imageUrl: imageUrl),
      ),
    );
  }

  Widget _buildTaskTypeContent(TaskModel task) {
    switch (task.taskType) {
      case 'multiple-choice':
        return _buildMultipleChoiceContent(task);
      case 'fill-in-the-blank':
        return _buildFillInTheBlankContent(task);
      case 'matching-pairs':
        return _buildMatchingPairsContent(task);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildMultipleChoiceContent(TaskModel task) {
    final choices = task.choices;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Дұрыс жауапты таңда:',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        ...choices
            .map(
              (choice) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: choice.isCorrect
                      ? Colors.green.shade100
                      : Colors.grey.shade100,
                  border: Border.all(
                    color: choice.isCorrect ? Colors.green : Colors.grey,
                    width: choice.isCorrect ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      choice.isCorrect
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: choice.isCorrect ? Colors.green : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Html(
                        data: choice.content,
                        shrinkWrap: true,
                        style: {
                          "*": Style(fontSize: FontSize(14)),
                          "img": Style(
                            display: Display.block,
                            margin: Margins.symmetric(vertical: 4),
                          ),
                        },
                        extensions: [_mathExtension()],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildFillInTheBlankContent(TaskModel task) {
    final answer = task.answer;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Толтыру:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        if (answer != null)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb, color: Colors.blue),
                const SizedBox(width: 8),
                const Text(
                  'Дұрыс жауап: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  answer.correctAnswer,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildMatchingPairsContent(TaskModel task) {
    final matchingPairs = task.matchingPairs;
    if (matchingPairs == null) return const SizedBox.shrink();

    final leftItems = matchingPairs.leftItems;
    final rightItems = matchingPairs.rightItems;

    // Определяем максимальное количество элементов для отображения
    final maxLength = leftItems.length > rightItems.length
        ? leftItems.length
        : rightItems.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Сәйкестендір:',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        // Отображаем элементы построчно для лучшего понимания соответствия
        ...List.generate(maxLength, (index) {
          final leftItem = index < leftItems.length ? leftItems[index] : null;
          final rightItem = index < rightItems.length
              ? rightItems[index]
              : null;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Левый элемент
                Expanded(
                  child: leftItem != null
                      ? Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            border: Border.all(color: Colors.blue.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                leftItem.leftId?.toString() ?? '',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 8),
                              Expanded(
                                child: Html(
                                  data: leftItem.content,
                                  shrinkWrap: true,
                                  style: {
                                    "*": Style(fontSize: FontSize(14)),
                                    "img": Style(
                                      display: Display.block,
                                      margin: Margins.symmetric(vertical: 4),
                                    ),
                                  },
                                  extensions: [_mathExtension()],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),

                // Разделитель с стрелкой
                Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),

                Expanded(
                  child: rightItem != null
                      ? Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            border: Border.all(color: Colors.green.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                rightItem.rightId?.toString() ?? '',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Html(
                                  data: rightItem.content,
                                  shrinkWrap: true,
                                  style: {
                                    "*": Style(fontSize: FontSize(14)),
                                    "img": Style(
                                      display: Display.block,
                                      margin: Margins.symmetric(vertical: 4),
                                    ),
                                  },
                                  extensions: [_mathExtension()],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  TagExtension _mathExtension() {
    return TagExtension(
      tagsToExtend: {"span"},
      builder: (extensionContext) {
        final formula = extensionContext.innerHtml
            .replaceAll(r"\(", "")
            .replaceAll(r"\)", "");

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Math.tex(
            formula,
            mathStyle: MathStyle.text,
            textStyle: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        );
      },
    );
  }
}

class _FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;

  const _FullScreenImageViewer({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: const EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 4.0,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            errorWidget: (context, url, error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Не удалось загрузить изображение',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    imageUrl,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
