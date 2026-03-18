import 'dart:async';

import 'src/app/application.dart';
import 'src/app/runner.dart';
import 'src/core/utils/loggers/logger.dart';

Future<void> main(List<String> args) async {
  Log.runLogging(() {
    runZonedGuarded(
      () async {
        await Runner().initializeAndRun(
          flavor: AppFlavor.development,
          args: args,
        );
      },
      Log.logZoneError,
    );
  });
}