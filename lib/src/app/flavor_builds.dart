part of 'application.dart';

Widget _buildApp({
  required AppFlavor flavor,
  required GoRouter router,
}) {
  switch (flavor) {
    case AppFlavor.development:
      return _devApp(router);
    case AppFlavor.production:
      return _prodApp(router);
  }
}

MaterialApp _devApp(GoRouter router) => _buildMaterialApp(
      router: router,
      title: 'Brand Admin',
    );

MaterialApp _prodApp(GoRouter router) => _buildMaterialApp(
      router: router,
      title: 'Brand Admin',
    );

MaterialApp _buildMaterialApp({
  required GoRouter router,
  required String title,
}) {
  return MaterialApp.router(
    title: title,
    routerConfig: router,
    theme: MaterialAppTheme.theme,
    darkTheme: MaterialAppTheme.dark,
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    locale: const Locale('ru', 'RU'),
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('ru', 'RU'),
      Locale('en', 'US'),
    ],
  );
}

enum AppFlavor {
  development('development'),
  production('production');

  final String envPath;
  const AppFlavor(this.envPath);
}
