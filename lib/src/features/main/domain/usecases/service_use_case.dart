import 'package:brand_admin/src/core/base/base_use_case/use_case.dart';
import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:brand_admin/src/features/main/data/models/chapters_model.dart';
import 'package:brand_admin/src/features/main/data/models/lessons_model.dart';
import 'package:brand_admin/src/features/main/data/models/subject_model.dart';
import 'package:brand_admin/src/features/main/data/models/task_model.dart';
import 'package:brand_admin/src/features/main/data/repository/service_repository_impl.dart';
import 'package:brand_admin/src/features/main/domain/repository/i_service_repository.dart';
import 'package:brand_admin/src/features/main/domain/request/service2_request.dart';
import 'package:brand_admin/src/features/main/domain/request/service_request.dart';

@lazySingleton
class GetSubjectsUseCase extends NoneInputBoundaryUseCase<List<SubjectModel>> {
  GetSubjectsUseCase(@Named.from(ServiceRepoImpl) this._repository);

  final IServiceRepo _repository;

  @override
  Future<Either<DomainException, List<SubjectModel>>> execute() async {
    return await _repository.getSubjects();
  }
}

@lazySingleton
class GetGradesUseCase extends UseCase<List<SubjectModel>, ServiceRequest> {
  GetGradesUseCase(@Named.from(ServiceRepoImpl) this._repository);

  final IServiceRepo _repository;

  @override
  Future<Either<DomainException, List<SubjectModel>>> execute(ServiceRequest request) async {
    return await _repository.getGrades(request);
  }
}


@lazySingleton
class GetChaptersUseCase extends UseCase<List<ChaptersModel>, ServiceRequest> {
  GetChaptersUseCase(@Named.from(ServiceRepoImpl) this._repository);

  final IServiceRepo _repository;

  @override
  Future<Either<DomainException, List<ChaptersModel>>> execute(ServiceRequest request) async {
    return await _repository.getChapters(request);
  }
}

@lazySingleton
class GetLessonsUseCase extends UseCase<List<LessonsModel>, ServiceRequest> {
  GetLessonsUseCase(@Named.from(ServiceRepoImpl) this._repository);

  final IServiceRepo _repository;

  @override
  Future<Either<DomainException, List<LessonsModel>>> execute(ServiceRequest request) async {
    return await _repository.getLessons(request);
  }
}


@lazySingleton
class GetGroupsUseCase extends UseCase<List<int>, ServiceRequest> {
  GetGroupsUseCase(@Named.from(ServiceRepoImpl) this._repository);

  final IServiceRepo _repository;

  @override
  Future<Either<DomainException, List<int>>> execute(ServiceRequest request) async {
    return await _repository.getGroups(request);
  }
}


@lazySingleton
class GetTasksUseCase extends UseCase<List<TaskModel>, Service2Request> {
  GetTasksUseCase(@Named.from(ServiceRepoImpl) this._repository);

  final IServiceRepo _repository;

  @override
  Future<Either<DomainException, List<TaskModel>>> execute(Service2Request request) async {
    return await _repository.getTasks(request);
  }
}