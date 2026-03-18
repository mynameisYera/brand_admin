import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:brand_admin/src/features/main/data/datasource/remote/i_service_remote.dart';
import 'package:brand_admin/src/features/main/data/datasource/remote/service_remote_impl.dart';
import 'package:brand_admin/src/features/main/data/models/chapters_model.dart';
import 'package:brand_admin/src/features/main/data/models/lessons_model.dart';
import 'package:brand_admin/src/features/main/data/models/subject_model.dart';
import 'package:brand_admin/src/features/main/data/models/task_model.dart';
import 'package:brand_admin/src/features/main/domain/repository/i_service_repository.dart';
import 'package:brand_admin/src/features/main/domain/request/service2_request.dart';
import 'package:brand_admin/src/features/main/domain/request/service_request.dart';

@named
@LazySingleton(as: IServiceRepo)
class ServiceRepoImpl implements IServiceRepo {
  ServiceRepoImpl(
    @Named.from(ServiceRemoteImpl) this._serviceRemote,
  );

  final IServiceRemote _serviceRemote;

  @override
  Future<Either<DomainException, List<SubjectModel>>> getSubjects() async {
    return await _serviceRemote.getSubjects();
  }

  @override
  Future<Either<DomainException, List<SubjectModel>>> getGrades(ServiceRequest request) async {
    return await _serviceRemote.getGrades(request);
  }

  @override
  Future<Either<DomainException, List<ChaptersModel>>> getChapters(ServiceRequest request) async {
    return await _serviceRemote.getChapters(request);
  }

  @override
  Future<Either<DomainException, List<LessonsModel>>> getLessons(ServiceRequest request) async {
    return await _serviceRemote.getLessons(request);
  }

  @override
  Future<Either<DomainException, List<int>>> getGroups(ServiceRequest request) async {
    return await _serviceRemote.getGroups(request);
  }

  @override
  Future<Either<DomainException, List<TaskModel>>> getTasks(Service2Request request) async {
    return await _serviceRemote.getTasks(request);
  }
}
