import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:brand_admin/src/features/main/data/models/chapters_model.dart';
import 'package:brand_admin/src/features/main/data/models/lessons_model.dart';
import 'package:brand_admin/src/features/main/data/models/subject_model.dart';
import 'package:brand_admin/src/features/main/data/models/task_model.dart';
import 'package:brand_admin/src/features/main/domain/request/service2_request.dart';
import 'package:brand_admin/src/features/main/domain/request/service_request.dart';

abstract interface class IServiceRepo {
  Future<Either<DomainException, List<SubjectModel>>> getSubjects();
  Future<Either<DomainException, List<SubjectModel>>> getGrades(ServiceRequest request);
  Future<Either<DomainException, List<ChaptersModel>>> getChapters(ServiceRequest request);
  Future<Either<DomainException, List<LessonsModel>>> getLessons(ServiceRequest request);
  Future<Either<DomainException, List<int>>> getGroups(ServiceRequest request);
  Future<Either<DomainException, List<TaskModel>>> getTasks(Service2Request request);
}
