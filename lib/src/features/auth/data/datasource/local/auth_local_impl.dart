import 'package:brand_admin/src/core/exceptions/domain_exception.dart';
import 'package:brand_admin/src/core/service/storage/flutter_secure_storage.dart';
import 'package:brand_admin/src/features/auth/data/datasource/local/i_auth_local.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@named
@LazySingleton(as: IAuthLocal)
class AuthLocalImpl implements IAuthLocal {
  final FlutterSecureStorageWeb flutterSecure = FlutterSecureStorageWeb();

  @override
  Future<Either<DomainException, void>> login({required String refresh, required String access}) async {
    await flutterSecure.setToken(access);
    await flutterSecure.setRefresh(refresh);
    return const Right(null);
  }
}
