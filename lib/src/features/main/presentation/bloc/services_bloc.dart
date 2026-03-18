import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:brand_admin/src/core/base/base_bloc/bloc/base_bloc.dart';
import 'package:brand_admin/src/core/base/base_bloc/context/context_activity_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:brand_admin/src/features/main/data/models/chapters_model.dart';
import 'package:brand_admin/src/features/main/data/models/lessons_model.dart';
import 'package:brand_admin/src/features/main/data/models/subject_model.dart';
import 'package:brand_admin/src/features/main/data/models/task_model.dart';
import 'package:brand_admin/src/features/main/domain/request/service2_request.dart';
import 'package:brand_admin/src/features/main/domain/request/service_request.dart';
import 'package:brand_admin/src/features/main/domain/usecases/service_use_case.dart';


part 'service_event.dart';
part 'service_state.dart';
part 'services_bloc.freezed.dart';


class ServicesBloc extends BaseBloc<ServicesEvent, ServicesState> {
  ServicesBloc(
    this._getSubjectsUseCase, 
    this._getGradesUseCase, 
    this._getChaptersUseCase, 
    this._getLessonsUseCase,
    this._getGroupsUseCase,
    this._getTasksUseCase,
  ) : super(ServicesState.initial(), ContextActivityBloc());
  final GetSubjectsUseCase _getSubjectsUseCase;
  final GetGradesUseCase _getGradesUseCase;
  final GetChaptersUseCase _getChaptersUseCase;
  final GetLessonsUseCase _getLessonsUseCase;
  final GetGroupsUseCase _getGroupsUseCase;
  final GetTasksUseCase _getTasksUseCase;

  @override
  Future<void> onEventHandler(ServicesEvent event, Emitter emit) async {
    await event.when(
      getSubjectsEvent: () => _getSubjects(emit),
      getGradesEvent: (subjectId) => _getGrades(emit, event as _GetGradesEvent),
      getChaptersEvent: (gradeId) => _getChapters(emit, event as _GetChaptersEvent),
      getLessonsEvent: (chapterId) => _getLessons(emit, event as _GetLessonsEvent),
      getGroupsEvent: (lessonId) => _getGroups(emit, event as _GetGroupsEvent),
      getTasksEvent: (lessonId, groupId) => _getTasks(emit, event as _GetTasksEvent),
    );
  }

  Future<void> _getSubjects(Emitter emit) async {
    emit(ServicesState.loading());
    final result = await _getSubjectsUseCase.call();
    if (result.isSuccessful) {
      emit(ServicesState.success(ServicesViewModel(subjects: result.data)));
    } else {
      emit(ServicesState.loadingError(result.failure?.message ?? ''));
    }
  }

  Future<void> _getGrades(Emitter emit, _GetGradesEvent event) async {
    emit(ServicesState.loading());
    final result = await _getGradesUseCase.call(ServiceRequest(id: event.subjectId));
    if (result.isSuccessful) {
      emit(ServicesState.success(ServicesViewModel(grades: result.data)));
    } else {
      emit(ServicesState.loadingError(result.failure?.message ?? ''));
    }
  }

  Future<void> _getChapters(Emitter emit, _GetChaptersEvent event) async {
    emit(ServicesState.loading());
    final result = await _getChaptersUseCase.call(ServiceRequest(id: event.gradeId));
    if (result.isSuccessful) {
      emit(ServicesState.success(ServicesViewModel(chapters: result.data)));
    } else {
      emit(ServicesState.loadingError(result.failure?.message ?? ''));
    }
  }

  Future<void> _getLessons(Emitter emit, _GetLessonsEvent event) async {
    emit(ServicesState.loading());
    final result = await _getLessonsUseCase.call(ServiceRequest(id: event.chapterId));
    if (result.isSuccessful) {
      emit(ServicesState.success(ServicesViewModel(lessons: result.data)));
    } else {
      emit(ServicesState.loadingError(result.failure?.message ?? ''));
    }
  }

  Future<void> _getGroups(Emitter emit, _GetGroupsEvent event) async {
    emit(ServicesState.loading());
    final result = await _getGroupsUseCase.call(ServiceRequest(id: event.lessonId));
    if (result.isSuccessful) {
      emit(ServicesState.success(ServicesViewModel(groups: result.data)));
    } else {
      emit(ServicesState.loadingError(result.failure?.message ?? ''));
    }
  }

  Future<void> _getTasks(Emitter emit, _GetTasksEvent event) async {
    emit(ServicesState.loading());
    final result = await _getTasksUseCase.call(Service2Request(lessonId: event.lessonId, groupId: event.groupId));
    if (result.isSuccessful) {
      emit(ServicesState.success(ServicesViewModel(tasks: result.data)));
    } else {
      emit(ServicesState.loadingError(result.failure?.message ?? ''));
    }
  }
}
