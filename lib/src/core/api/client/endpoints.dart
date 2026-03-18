class EndPoints {
  static const String baseUrl = 'https://dev.brand-online.kz/';

  // login
  static const String login = 'api/auth/login';
  // refresh token
  static const String refreshToken = 'api/auth/token/refresh';

  // debug endpoints
  static const String debugSubjects = 'api/debug/subjects';
  static String debugSubjectQuestions(int subjectId) =>
      'api/debug/subjects/$subjectId/questions';

  // legacy quality endpoints
  static String qualityChaptersLessons(int chapterId) =>
      'quality/chapters/$chapterId/lessons/';
  static String qualityGradesChapters(int gradeId) =>
      'quality/grades/$gradeId/chapters/';
  static String qualityLessonsGroups(int lessonId) =>
      'quality/lessons/$lessonId/groups/';
  static String qualityLessonsGroupsTasks(int lessonId, int groupNumber) =>
      'quality/lessons/$lessonId/groups/$groupNumber/tasks/';
  static const String qualitySubjects = 'quality/subjects/';
  static String qualitySubjectsGrades(int subjectId) =>
      'quality/subjects/$subjectId/grades/';
  static String qualityTasksCheck(int taskId) => 'quality/tasks/$taskId/check/';
}
