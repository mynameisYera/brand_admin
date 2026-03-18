part of 'services_bloc.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState.initial() = _Initial;
  const factory ServicesState.loading() = _Loading;
  const factory ServicesState.loadingError(String message) = _LoadingError;
  const factory ServicesState.success(ServicesViewModel viewModel) = _Success;
}

@freezed
class ServicesViewModel with _$ServicesViewModel {
  factory ServicesViewModel({
    List<SubjectModel>? subjects,
    List<SubjectModel>? grades,
    List<ChaptersModel>? chapters,
    List<LessonsModel>? lessons,
    List<int>? groups,
    List<TaskModel>? tasks,
  }) = _ServicesViewModel;
}
