part of 'services_bloc.dart';

@freezed
class ServicesEvent with _$ServicesEvent {
  const factory ServicesEvent.getSubjectsEvent() = _GetSubjectsEvent;
  const factory ServicesEvent.getGradesEvent(int subjectId) = _GetGradesEvent;
  const factory ServicesEvent.getChaptersEvent(int gradeId) = _GetChaptersEvent;
  const factory ServicesEvent.getLessonsEvent(int chapterId) = _GetLessonsEvent;
  const factory ServicesEvent.getGroupsEvent(int lessonId) = _GetGroupsEvent;
  const factory ServicesEvent.getTasksEvent(int lessonId, int groupId) = _GetTasksEvent;
}