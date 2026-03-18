import 'package:dio/dio.dart';
import 'package:brand_admin/src/core/api/client/endpoints.dart';
import 'package:brand_admin/src/core/api/client/rest/dio/dio_client.dart';
import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:brand_admin/src/core/service/storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:brand_admin/src/features/main/data/models/chapters_model.dart';
import 'package:brand_admin/src/features/main/data/models/lessons_model.dart';
import 'package:brand_admin/src/features/main/data/models/subject_model.dart';
import 'package:brand_admin/src/features/main/data/models/task_model.dart';
import 'package:brand_admin/src/features/main/domain/request/service2_request.dart';
import 'package:brand_admin/src/features/main/domain/request/service_request.dart';

import 'i_service_remote.dart';

@named
@LazySingleton(as: IServiceRemote)
class ServiceRemoteImpl implements IServiceRemote {
  Dio get dioClient => DioInterceptor(Dio()).getDio;
  final FlutterSecureStorageWeb flutterSecure = FlutterSecureStorageWeb();

  @override
  Future<Either<DomainException, List<SubjectModel>>> getSubjects() async {
    try {
      final result = await dioClient.get(EndPoints.qualitySubjects);
      return Right((result.data as List<dynamic>)
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList());
    } catch (e) {
      return Left(e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, List<SubjectModel>>> getGrades(ServiceRequest request) async {
    try {
      final result = await dioClient.get(EndPoints.qualitySubjectsGrades(request.id));
      return Right((result.data as List<dynamic>)
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList());
    } catch (e) {
      return Left(e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, List<ChaptersModel>>> getChapters(ServiceRequest request) async {
    try {
      final result = await dioClient.get(EndPoints.qualityGradesChapters(request.id));
      return Right((result.data as List<dynamic>)
          .map((e) => ChaptersModel.fromJson(e as Map<String, dynamic>))
          .toList());
    } catch (e) {
      return Left(e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, List<LessonsModel>>> getLessons(ServiceRequest request) async {
    try {
      final result = await dioClient.get(EndPoints.qualityChaptersLessons(request.id));
      return Right((result.data as List<dynamic>)
          .map((e) => LessonsModel.fromJson(e as Map<String, dynamic>))
          .toList());
    } catch (e) {
      return Left(e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, List<int>>> getGroups(ServiceRequest request) async {
    try {
      final result = await dioClient.get(EndPoints.qualityLessonsGroups(request.id));
      return Right((result.data as List<dynamic>).map((e) => e as int).toList());
    } catch (e) {
      return Left(e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, List<TaskModel>>> getTasks(
    Service2Request request,
  ) async {
    try {
      final response = await dioClient.get(
        EndPoints.qualityLessonsGroupsTasks(request.lessonId, request.groupId),
      );

      final data = response.data;
      
      if (data is! List) {
        throw UnknownException(message: 'Unexpected data format: $data');
      }

      final tasks = data.map((e) {
        if (e is Map<String, dynamic>) {
          try {
            final Map<String, dynamic> fixedData = Map<String, dynamic>.from(e);
            if (fixedData['matching_pairs'] is List && (fixedData['matching_pairs'] as List).isEmpty) {
              fixedData['matching_pairs'] = null;
            }
            return TaskModel.fromJson(fixedData);
          } catch (parseError) {
            throw UnknownException(message: 'Failed to parse task: $parseError');
          }
        } else {
          throw UnknownException(message: 'Invalid task data format: $e');
        }
      }).toList();

      return Right(tasks);
    } catch (e) {
      return Left(
        e is DomainException
            ? e
            : UnknownException(message: e.toString()),
      );
    }
  }

}
