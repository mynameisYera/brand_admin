part of 'router.dart';

List<RouteBase> _routes() => <RouteBase>[
  GoRoute(
    name: RouteNames.loginPasswordPage,
    path: RoutePaths.loginPasswordPage,
    pageBuilder: (context, state) =>
        NoTransitionPage(key: state.pageKey, child: const LoginPasswordPage()),
  ),
  GoRoute(
    name: RouteNames.subjectPage,
    path: RoutePaths.subjectPage,
    pageBuilder: (context, state) =>
        NoTransitionPage(key: state.pageKey, child: const SubjectPage()),
  ),
  GoRoute(
    name: RouteNames.debugSubjectsPage,
    path: RoutePaths.debugSubjectsPage,
    pageBuilder: (context, state) {
      final track = (state.extra as String?) ?? 'ent';
      return NoTransitionPage(
        key: state.pageKey,
        child: DebugSubjectsPage(track: track),
      );
    },
  ),
  GoRoute(
    name: RouteNames.debugQuestionTypesPage,
    path: RoutePaths.debugQuestionTypesPage,
    pageBuilder: (context, state) {
      final extra = state.extra as Map<String, dynamic>? ?? <String, dynamic>{};
      final subject = extra['subject'] is Map<String, dynamic>
          ? extra['subject'] as Map<String, dynamic>
          : <String, dynamic>{};
      final track = (extra['track'] ?? 'ent').toString();
      return NoTransitionPage(
        key: state.pageKey,
        child: DebugQuestionTypesPage(subject: subject, track: track),
      );
    },
  ),
  GoRoute(
    name: RouteNames.debugQuestionsPage,
    path: RoutePaths.debugQuestionsPage,
    pageBuilder: (context, state) {
      final extra = state.extra as Map<String, dynamic>? ?? <String, dynamic>{};
      final subjectId = extra['subjectId'] is int
          ? extra['subjectId'] as int
          : int.tryParse('${extra['subjectId']}') ?? 0;
      final questionType = (extra['questionType'] ?? '').toString();
      final questionTypeLabel = (extra['questionTypeLabel'] ?? questionType)
          .toString();
      final subjectName = (extra['subjectName'] ?? 'Subject').toString();
      return NoTransitionPage(
        key: state.pageKey,
        child: DebugQuestionsPage(
          subjectId: subjectId,
          questionType: questionType,
          questionTypeLabel: questionTypeLabel,
          subjectName: subjectName,
        ),
      );
    },
  ),
  GoRoute(
    name: RouteNames.tasksPage,
    path: RoutePaths.tasksPage,
    pageBuilder: (context, state) {
      final List<int> params = state.extra as List<int>;
      return NoTransitionPage(
        key: state.pageKey,
        child: TasksPage(lessonId: params[0], groupId: params[1]),
      );
    },
  ),
];
