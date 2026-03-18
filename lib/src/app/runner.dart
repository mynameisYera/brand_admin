import 'package:brand_admin/src/core/service/injectable/injectable_service.dart';
import 'package:brand_admin/src/core/utils/loggers/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';

import 'application.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';
class Runner {
  Future<void> initializeAndRun({
    required AppFlavor flavor,
    required List<String> args,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = Log.logFlutterError;
    await FlutterSecureStorageWeb();
    await configureDependencies();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    MainApp(flavor: flavor).run();
  }
}
