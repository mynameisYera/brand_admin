import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:brand_admin/src/features/auth/data/models/login_model.dart';
import 'package:brand_admin/src/features/auth/domain/request/login_request.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IAuthRemote {
  Future<Either<DomainException, LoginModel>> login(LoginRequest request);
}
