import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:brand_admin/src/core/colors/colors.dart';
import 'package:brand_admin/src/core/router/router.dart';

class DebugQuestionTypesPage extends StatelessWidget {
  const DebugQuestionTypesPage({
    super.key,
    required this.subject,
    required this.track,
  });

  final Map<String, dynamic> subject;
  final String track;

  @override
  Widget build(BuildContext context) {
    final subjectName = (subject['name'] ?? 'Subject').toString();
    final subjectId = _toInt(subject['id']);
    final allowedTypes = _toMapList(subject['allowed_question_types']);
    final counts = subject['question_counts'] is Map<String, dynamic>
        ? subject['question_counts'] as Map<String, dynamic>
        : <String, dynamic>{};

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Тип таңдау • $subjectName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.grey.withOpacity(0.45)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      track.toUpperCase(),
                      style: const TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Gap(10),
                  const Expanded(
                    child: Text(
                      'Шаг 3: выберите тип вопроса',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(12),
            if (allowedTypes.isEmpty)
              const Text('У предмета нет allowed_question_types'),
            if (allowedTypes.isNotEmpty)
              Expanded(
                child: ListView(
                  children: allowedTypes.map((type) {
                    final code = (type['code'] ?? '').toString();
                    final label = (type['label'] ?? code).toString();
                    final count = counts[code];
                    if (code.isEmpty) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Material(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                        elevation: 1,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: subjectId == null
                              ? null
                              : () {
                                  context.push(
                                    RoutePaths.debugQuestionsPage,
                                    extra: <String, dynamic>{
                                      'subjectId': subjectId,
                                      'questionType': code,
                                      'questionTypeLabel': label,
                                      'subjectName': subjectName,
                                    },
                                  );
                                },
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        label,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'code: $code',
                                        style: const TextStyle(
                                          color: AppColors.textExtraGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (count != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.mainColor.withOpacity(
                                        0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Text(
                                      '$count',
                                      style: const TextStyle(
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                const Gap(8),
                                const Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
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

int? _toInt(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}
