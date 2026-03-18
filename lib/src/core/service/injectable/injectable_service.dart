import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_service.config.dart';
import 'manual_register_services.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() async {
  getIt.init();
  manualRegisterServices();
}
