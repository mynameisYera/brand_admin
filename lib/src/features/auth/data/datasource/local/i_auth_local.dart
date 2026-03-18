import 'package:fpdart/fpdart.dart';
import 'package:brand_admin/src/core/exceptions/domain_exception.dart';

abstract interface class IAuthLocal {
  Future<Either<DomainException, void>> login(
      {required String refresh, required String access});
}
