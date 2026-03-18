import 'package:dio/dio.dart';
import 'package:brand_admin/src/core/api/client/endpoints.dart';
import 'package:brand_admin/src/core/api/client/rest/dio/dio_client.dart';
import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:brand_admin/src/core/service/storage/flutter_secure_storage.dart';
import 'package:brand_admin/src/features/auth/data/models/login_model.dart';
import 'package:brand_admin/src/features/auth/domain/request/login_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import 'i_auth_remote.dart';

@named
@LazySingleton(as: IAuthRemote)
class AuthRemoteImpl implements IAuthRemote {
  Dio get dioClient => DioInterceptor(Dio()).getDio;
  final FlutterSecureStorageWeb flutterSecure = FlutterSecureStorageWeb();
  @override
  Future<Either<DomainException, LoginModel>> login(
    LoginRequest request,
  ) async {
    try {
      final response = await dioClient.post(
        EndPoints.login,
        data: request.toJson(),
      );
      final rawData = response.data;
      final data = rawData is Map<String, dynamic>
          ? rawData
          : <String, dynamic>{};
      final tokens = data['tokens'] is Map<String, dynamic>
          ? data['tokens'] as Map<String, dynamic>
          : data;
      final access = (tokens['access'] ?? '').toString();
      final refresh = (tokens['refresh'] ?? '').toString();
      final dto = LoginModel(access: access, refresh: refresh);

      if (response.statusCode == 200 && dto.access.isNotEmpty) {
        await flutterSecure.setToken(dto.access);
        return Right(dto);
      } else {
        return Left(UnknownException(message: 'Error: ${response.statusCode}'));
      }
    } catch (e) {
      if (e is DioException) {
        String errorMessage = 'Произошла ошибка при входе';

        if (e.response?.data != null && e.response?.data is Map) {
          final data = e.response!.data as Map<String, dynamic>;
          if (data.containsKey('detail')) {
            errorMessage = data['detail'] as String;
          } else if (data.containsKey('message')) {
            errorMessage = data['message'] as String;
          }
        } else if (e.message != null && e.message!.isNotEmpty) {
          errorMessage = e.message!;
        }

        return Left(UnknownException(message: errorMessage));
      }

      return Left(
        e is DomainException ? e : UnknownException(message: e.toString()),
      );
    }
  }
}
