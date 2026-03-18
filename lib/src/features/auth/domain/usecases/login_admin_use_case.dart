import 'package:brand_admin/src/core/base/base_use_case/use_case.dart';
import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:brand_admin/src/features/auth/data/models/login_model.dart';
import 'package:brand_admin/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:brand_admin/src/features/auth/domain/repository/i_auth_repository.dart';
import 'package:brand_admin/src/features/auth/domain/request/login_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginAdminUseCase extends UseCase<LoginModel, LoginRequest> {
  LoginAdminUseCase(@Named.from(AuthRepoImpl) this._repository);

  final IAuthRepo _repository;

  @override
  Future<Either<DomainException, LoginModel>> execute(
      LoginRequest requestModel) async {
    return await _repository.login(requestModel);
  }
}
