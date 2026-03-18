import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:brand_admin/src/core/api/client/endpoints.dart';
import 'package:brand_admin/src/core/api/client/rest/dio/dio_client.dart';
import 'package:brand_admin/src/core/colors/colors.dart';
import 'package:brand_admin/src/core/router/router.dart';

class DebugSubjectsPage extends StatefulWidget {
  const DebugSubjectsPage({super.key, required this.track});

  final String track;

  @override
  State<DebugSubjectsPage> createState() => _DebugSubjectsPageState();
}

class _DebugSubjectsPageState extends State<DebugSubjectsPage> {
  final Dio _dio = DioInterceptor(Dio()).getDio;

  bool _isLoading = false;
  String? _error;
  List<Map<String, dynamic>> _subjects = const [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  Future<void> _loadSubjects() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await _dio.get(EndPoints.debugSubjects);
      final data = response.data is Map<String, dynamic>
          ? response.data as Map<String, dynamic>
          : <String, dynamic>{};
      final key = widget.track == 'nkt' ? 'nkt' : 'ent';
      setState(() {
        _subjects = _toMapList(data[key]);
      });
    } on DioException catch (e) {
      setState(() {
        _error = _mapApiError(e);
      });
    } catch (_) {
      setState(() {
        _error = 'Не удалось загрузить предметы';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final trackLabel = widget.track.toUpperCase();

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Пән таңдау • $trackLabel'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            )
          : _error != null
          ? _ErrorView(message: _error!, onRetry: _loadSubjects)
          : _subjects.isEmpty
          ? const Center(child: Text('Предметы не найдены'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _subjects.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.grey.withOpacity(0.5),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.menu_book_rounded,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Шаг 2: выберите предмет',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final subject = _subjects[index - 1];
                final name = (subject['name'] ?? 'Без названия').toString();
                final id = subject['id']?.toString() ?? '-';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    elevation: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        context.push(
                          RoutePaths.debugQuestionTypesPage,
                          extra: <String, dynamic>{
                            'subject': subject,
                            'track': widget.track,
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: AppColors.mainColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.school_rounded,
                                color: AppColors.mainColor,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'ID: $id',
                                    style: const TextStyle(
                                      color: AppColors.textExtraGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
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
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> _toMapList(dynamic raw) {
  if (raw is! List) return const [];
  return raw.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
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
