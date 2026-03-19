import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:brand_admin/src/core/api/client/endpoints.dart';
import 'package:brand_admin/src/core/api/client/rest/dio/dio_client.dart';
import 'package:brand_admin/src/core/colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DebugQuestionsPage extends StatefulWidget {
  const DebugQuestionsPage({
    super.key,
    required this.subjectId,
    required this.questionType,
    required this.questionTypeLabel,
    required this.subjectName,
  });

  final int subjectId;
  final String questionType;
  final String questionTypeLabel;
  final String subjectName;

  @override
  State<DebugQuestionsPage> createState() => _DebugQuestionsPageState();
}

class _DebugQuestionsPageState extends State<DebugQuestionsPage> {
  final Dio _dio = DioInterceptor(Dio()).getDio;

  bool _isLoading = false;
  String? _error;
  List<Map<String, dynamic>> _questions = const [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _hasNextPage = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions(page: 1);
  }

  Future<void> _loadQuestions({required int page}) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await _dio.get(
        EndPoints.debugSubjectQuestions(widget.subjectId),
        queryParameters: <String, dynamic>{
          'question_type': widget.questionType,
          'page': page,
          'page_size': 20,
        },
      );

      final data = response.data is Map<String, dynamic>
          ? response.data as Map<String, dynamic>
          : <String, dynamic>{};
      final items = _extractQuestionItems(data);
      final currentPage = _toInt(data['page']) ?? page;
      final totalPages =
          _toInt(data['total_pages']) ??
          _toInt(data['pages']) ??
          ((data['count'] is int) ? ((data['count'] as int) / 20).ceil() : 1);
      final hasNext = data['next'] != null || currentPage < totalPages;

      setState(() {
        _questions = items;
        _currentPage = currentPage;
        _totalPages = totalPages < 1 ? 1 : totalPages;
        _hasNextPage = hasNext;
      });
    } on DioException catch (e) {
      setState(() {
        _error = _mapApiError(e);
      });
    } catch (_) {
      setState(() {
        _error = 'Не удалось загрузить вопросы';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  List<Map<String, dynamic>> _extractQuestionItems(Map<String, dynamic> data) {
    final dynamic raw =
        data['results'] ?? data['items'] ?? data['questions'] ?? data['data'];
    if (raw is! List) return const [];
    return raw
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasQuestions = _questions.isNotEmpty;
    final bool canGoPrev = _currentPage > 1 && !_isLoading;
    final bool canGoNext =
        (_hasNextPage || _currentPage < _totalPages) && !_isLoading;

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        // foregroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        title: Text(widget.subjectName),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(34),
        //   child: Padding(
        //     padding: const EdgeInsets.only(bottom: 8),
        //     child: Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        //       decoration: BoxDecoration(
        //         color: AppColors.mainColor.withOpacity(0.1),
        //         borderRadius: BorderRadius.circular(999),
        //       ),
        //       child: Text(
        //         widget.questionTypeLabel,
        //         style: const TextStyle(
        //           color: AppColors.mainColor,
        //           fontWeight: FontWeight.w600,
        //           fontSize: 12,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: _isLoading && _questions.isEmpty
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            )
          : _error != null && _questions.isEmpty
          ? _ErrorView(message: _error!, onRetry: () => _loadQuestions(page: 1))
          : Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () => _loadQuestions(page: _currentPage),
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                    itemCount: hasQuestions ? _questions.length + 1 : 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: AppColors.grey.withOpacity(0.45),
                                ),
                              ),
                              child: Text(
                                'Сұрақтар $_currentPage/$_totalPages',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Gap(12),
                            if (_error != null && _questions.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  _error!,
                                  style: const TextStyle(color: AppColors.red),
                                ),
                              ),
                            if (!hasQuestions && !_isLoading)
                              const Center(child: Text('Сұрақтар табылмады')),
                            if (hasQuestions) const SizedBox(height: 4),
                          ],
                        );
                      }

                      final qIndex = index - 1;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: qIndex == _questions.length - 1 ? 0 : 12,
                        ),
                        child: _QuestionCard(
                          index: qIndex + 1,
                          question: _questions[qIndex],
                          selectedTypeCode: widget.questionType,
                        ),
                      );
                    },
                  ),
                ),
                if (hasQuestions)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 18,
                    child: SafeArea(
                      top: false,
                      child: Center(
                        child: _SiteStylePagination(
                          currentApiPage: _currentPage,
                          totalApiPages: _totalPages,
                          isLoading: _isLoading,
                          onPrev: canGoPrev
                              ? () => _loadQuestions(page: _currentPage - 1)
                              : null,
                          onNext: canGoNext
                              ? () => _loadQuestions(page: _currentPage + 1)
                              : null,
                        ),
                      ),
                    ),
                  ),
                if (_isLoading && _questions.isNotEmpty)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 150),
                        child: Container(
                          color: Colors.black.withOpacity(0.12),
                          child: const Center(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                    Gap(10),
                                    Text(
                                      'Загрузка страницы...',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}

class _SiteStylePagination extends StatelessWidget {
  const _SiteStylePagination({
    required this.currentApiPage,
    required this.totalApiPages,
    required this.isLoading,
    required this.onPrev,
    required this.onNext,
  });

  final int currentApiPage;
  final int totalApiPages;
  final bool isLoading;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final width = (screenWidth - 32).clamp(220.0, 360.0).toDouble();

    return Container(
      width: width,
      constraints: const BoxConstraints(maxWidth: 360),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue.withOpacity(0.28), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _PagerButton(
            icon: Icons.keyboard_double_arrow_left_rounded,
            onTap: onPrev,
          ),
          Text(
            isLoading ? '...' : '$currentApiPage / $totalApiPages',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          _PagerButton(
            icon: Icons.keyboard_double_arrow_right_rounded,
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

class _PagerButton extends StatelessWidget {
  const _PagerButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: disabled
              ? AppColors.grey.withOpacity(0.4)
              : AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: AppColors.red),
            const Gap(12),
            Text(message, textAlign: TextAlign.center),
            const Gap(12),
            ElevatedButton(onPressed: onRetry, child: const Text('Қайталау')),
          ],
        ),
      ),
    );
  }
}

class _ImageLoadFallback extends StatelessWidget {
  const _ImageLoadFallback({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      color: AppColors.backgroundGrey,
      child: Row(
        children: [
          const Icon(Icons.broken_image_outlined, color: AppColors.red),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Фото табылмады',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textExtraGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              final uri = Uri.tryParse(url);
              if (uri == null) return;
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
            child: const Text('Ашу'),
          ),
        ],
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({required this.imageUrl, required this.onTap});

  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE3E8F2)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 140,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(strokeWidth: 2.2),
                        ),
                      );
                    },
                    errorBuilder: (_, __, ___) =>
                        _ImageLoadFallback(url: imageUrl),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.open_in_full_rounded,
                      size: 15,
                      color: AppColors.textExtraGrey,
                    ),
                    Gap(6),
                    Text(
                      'Открыть в полный экран',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textExtraGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FullScreenImagePage extends StatelessWidget {
  const _FullScreenImagePage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.black,
        title: const Text('Фото'),
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_new),
            onPressed: () async {
              final uri = Uri.tryParse(imageUrl);
              if (uri == null) return;
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
          ),
        ],
      ),
      body: InteractiveViewer(
        minScale: 1,
        maxScale: 5,
        child: Center(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
            errorBuilder: (_, __, ___) =>
                Center(child: _ImageLoadFallback(url: imageUrl)),
          ),
        ),
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.index,
    required this.question,
    required this.selectedTypeCode,
  });

  final int index;
  final Map<String, dynamic> question;
  final String selectedTypeCode;

  @override
  Widget build(BuildContext context) {
    final typeCode = (question['question_type'] ?? selectedTypeCode).toString();
    final promptHtml =
        _stringFrom(question['prompt_html']) ??
        _stringFrom(question['prompt']) ??
        '';
    final contextBody = _stringFrom(
      (question['context_block'] as Map?)?['body_html'],
    );
    final options = _toMapList(question['options'] ?? question['choices']);
    final matchingRows = _toMapList(question['matching_rows']);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey.withOpacity(0.35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'Q$index',
                  style: const TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
              const Gap(8),
              Expanded(
                child: Text(
                  'type: $typeCode | id: ${question['id'] ?? '-'}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textExtraGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Gap(8),
          ..._buildByType(
            context: context,
            typeCode: typeCode,
            promptHtml: promptHtml,
            contextBody: contextBody,
            options: options,
            matchingRows: matchingRows,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildByType({
    required BuildContext context,
    required String typeCode,
    required String promptHtml,
    required String? contextBody,
    required List<Map<String, dynamic>> options,
    required List<Map<String, dynamic>> matchingRows,
  }) {
    switch (typeCode) {
      case 'single':
      case 'multiple':
        return [
          _htmlBlock(context, promptHtml),
          const Gap(8),
          ..._buildOptions(context, options),
        ];
      case 'context_single':
        return [
          if (contextBody != null && contextBody.isNotEmpty)
            _htmlBlock(context, contextBody),
          if (contextBody != null && contextBody.isNotEmpty) const Gap(8),
          _htmlBlock(context, promptHtml),
          const Gap(8),
          ..._buildOptions(context, options),
        ];
      case 'matching':
        return [
          _htmlBlock(context, promptHtml),
          const Gap(8),
          ..._buildMatchingRows(context, matchingRows, options),
          if (matchingRows.isNotEmpty) const Gap(8),
          Text(
            'Барлық жауаптар',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          if (matchingRows.isNotEmpty) const Gap(8),
          ..._buildOptions(context, options),
        ];
      default:
        return [
          _htmlBlock(context, promptHtml),
          const Gap(8),
          ..._buildOptions(context, options),
        ];
    }
  }

  Widget _htmlBlock(BuildContext context, String html) {
    if (html.isEmpty) return const SizedBox.shrink();
    final imageUrls = <String>{
      ..._extractImageUrls(html),
      ..._extractPlainImageUrls(html),
    }.toList();
    final textOnlyHtml = _removePlainImageUrls(_removeImageTags(html)).trim();

    if (imageUrls.isEmpty) {
      return Html(data: html);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...imageUrls.map(
          (url) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _ImagePreview(
              imageUrl: url,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => _FullScreenImagePage(imageUrl: url),
                  ),
                );
              },
            ),
          ),
        ),
        if (textOnlyHtml.isNotEmpty) Html(data: textOnlyHtml),
      ],
    );
  }

  List<Widget> _buildOptions(
    BuildContext context,
    List<Map<String, dynamic>> options,
  ) {
    if (options.isEmpty) return [const Text('Нет options')];
    return options.map((option) {
      final optionHtml =
          _stringFrom(option['option_html']) ??
          _stringFrom(option['label_html']) ??
          _stringFrom(option['content']) ??
          _stringFrom(option['text']) ??
          '';
      final label = _stringFrom(option['label']) ?? _stringFrom(option['code']);
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE8EBF2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null && label.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE1E5EE)),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textExtraGrey,
                  ),
                ),
              ),
            if (label != null && label.isNotEmpty) const Gap(4),
            _htmlBlock(context, optionHtml),
          ],
        ),
      );
    }).toList();
  }

  List<Widget> _buildMatchingRows(
    BuildContext context,
    List<Map<String, dynamic>> rows,
    List<Map<String, dynamic>> options,
  ) {
    if (rows.isEmpty) return [const SizedBox.shrink()];

    final optionById = <int, Map<String, dynamic>>{};
    for (final option in options) {
      final id = _toInt(option['id']);
      if (id != null) {
        optionById[id] = option;
      }
    }

    return rows.map((row) {
      final left =
          _stringFrom(row['left_html']) ??
          _stringFrom(row['left']) ??
          _stringFrom(row['prompt_html']) ??
          '';
      final correctOptionId = _toInt(row['correct_option_id']);
      final matchedOption = correctOptionId == null
          ? null
          : optionById[correctOptionId];

      final right =
          _stringFrom(matchedOption?['option_html']) ??
          _stringFrom(matchedOption?['label_html']) ??
          _stringFrom(matchedOption?['content']) ??
          _stringFrom(matchedOption?['text']) ??
          _stringFrom(row['right_html']) ??
          _stringFrom(row['right']) ??
          _stringFrom(row['answer_html']) ??
          '';

      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6FA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE3E8F2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _htmlBlock(context, left),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.arrow_forward, size: 14),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFD8DEEB)),
                ),
                child: _htmlBlock(context, right),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  List<Map<String, dynamic>> _toMapList(dynamic raw) {
    if (raw is! List) return const [];
    return raw
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  String? _stringFrom(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }

  List<String> _extractImageUrls(String html) {
    final regex = RegExp(
      r'''<img[^>]*src=["']([^"']+)["'][^>]*>''',
      caseSensitive: false,
    );
    return regex
        .allMatches(html)
        .map((m) => m.group(1) ?? '')
        .where((url) => url.isNotEmpty)
        .toList();
  }

  List<String> _extractPlainImageUrls(String html) {
    final regex = RegExp(r'''https?://[^\s"'<>]+''', caseSensitive: false);
    return regex
        .allMatches(html)
        .map((m) => (m.group(0) ?? '').trim())
        .where((url) => _looksLikeImageUrl(url))
        .toList();
  }

  String _removeImageTags(String html) {
    return html.replaceAll(RegExp(r'<img[^>]*>', caseSensitive: false), '');
  }

  String _removePlainImageUrls(String html) {
    return html.replaceAll(
      RegExp(r'''https?://[^\s"'<>]+''', caseSensitive: false),
      '',
    );
  }

  bool _looksLikeImageUrl(String url) {
    final lower = url.toLowerCase();
    return lower.contains('.png') ||
        lower.contains('.jpg') ||
        lower.contains('.jpeg') ||
        lower.contains('.gif') ||
        lower.contains('.webp') ||
        lower.contains('.svg');
  }
}

int? _toInt(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}

String _mapApiError(DioException e) {
  final statusCode = e.response?.statusCode;
  if (statusCode == 401) return '401: Без токена (Unauthorized)';
  if (statusCode == 403) return '403: Доступ только для admin';
  if (statusCode == 400) {
    return '400: Неверный или неразрешенный question_type для предмета';
  }
  final data = e.response?.data;
  if (data is Map<String, dynamic>) {
    final detail = data['detail'] ?? data['message'] ?? data['error'];
    if (detail != null && detail.toString().isNotEmpty) {
      return detail.toString();
    }
  }
  return e.message ?? 'Произошла ошибка запроса';
}
