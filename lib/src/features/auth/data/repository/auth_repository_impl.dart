import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:brand_admin/src/features/auth/data/datasource/local/auth_local_impl.dart';
import 'package:brand_admin/src/features/auth/data/datasource/local/i_auth_local.dart';
import 'package:brand_admin/src/features/auth/data/datasource/remote/auth_remote_impl.dart';
import 'package:brand_admin/src/features/auth/data/datasource/remote/i_auth_remote.dart';
import 'package:brand_admin/src/features/auth/data/models/login_model.dart';
import 'package:brand_admin/src/features/auth/domain/repository/i_auth_repository.dart';
import 'package:brand_admin/src/features/auth/domain/request/login_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@named
@LazySingleton(as: IAuthRepo)
class AuthRepoImpl implements IAuthRepo {
  AuthRepoImpl(
    @Named.from(AuthRemoteImpl) this._authRemote,
    @Named.from(AuthLocalImpl) this._authLocal,
  );

  final IAuthRemote _authRemote;
  final IAuthLocal _authLocal;

  @override
  Future<Either<DomainException, LoginModel>> login(
      LoginRequest loginRequest) async {
    try {
      final result = await _authRemote.login(loginRequest);

      return await result.fold(
        (DomainException error) => Left(error),
        (LoginModel dto) async {
          await _authLocal.login(
            refresh: dto.refresh,
            access: dto.access,
          );
          return Right(dto);
        },
      );
    } catch (e) {
      return Left(
        e is DomainException ? e : UnknownException(message: e.toString()),
      );
    }
  }

}
