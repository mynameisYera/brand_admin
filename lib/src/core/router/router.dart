import 'package:brand_admin/src/core/error/router_error_page.dart';
import 'package:brand_admin/src/features/auth/presentation/pages/login_password_page.dart';
import 'package:brand_admin/src/features/main/presentation/page/debug_question_types_page.dart';
import 'package:brand_admin/src/features/main/presentation/page/debug_questions_page.dart';
import 'package:brand_admin/src/features/main/presentation/page/debug_subjects_page.dart';
import 'package:brand_admin/src/features/main/presentation/page/subject_page.dart';
import 'package:brand_admin/src/features/main/presentation/page/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:brand_admin/src/core/service/storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

part 'route_list.dart';
part 'route_transitions.dart';
part 'router_names.dart';
part 'router_paths.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter routerProvider() {
  final flutterSecure = FlutterSecureStorageWeb();

  return GoRouter(
    initialLocation: RoutePaths.subjectPage,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) async {
      final token = await flutterSecure.getToken();
      if (state.matchedLocation == RoutePaths.loginPasswordPage ||
          state.matchedLocation == RoutePaths.loginPasswordPage) {
        return null;
      }

      if (token == null || token == 'null' || token.isEmpty) {
        return RoutePaths.loginPasswordPage;
      }
      return null;
    },
    routes: _routes(),
    errorBuilder: (context, state) => const RouteErrorPage(),
  );
}
