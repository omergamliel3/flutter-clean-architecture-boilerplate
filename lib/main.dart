import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/config/app_config.dart';
import 'app/routes/app_routes.dart';

import 'app/theme/theme_provider.dart';
import 'app/theme/theme_state.dart';
import 'app/theme/theme.dart';

import 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.setup();
  Routes.createRoutes();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ThemeProvider(),
        lazy: false,
        child: BlocBuilder<ThemeProvider, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConfig.APP_NAME,
              theme: lightThemeData(),
              darkTheme: darkThemeData(),
              themeMode: state.when(
                  light: () => ThemeMode.light,
                  dark: () => ThemeMode.dark,
                  system: () => ThemeMode.system),
              navigatorKey: Routes.sailor.navigatorKey,
              initialRoute: Pages.SPLASH,
              onGenerateRoute: Routes.sailor.generator(),
            );
          },
        ));
  }
}
