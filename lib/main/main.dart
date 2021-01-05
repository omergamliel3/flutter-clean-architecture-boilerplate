import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/app_config.dart';

import '../app/theme/theme.dart';
import '../app/routes/app_routes.dart';

import '../di/injector.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Injector.resolve<ThemeProvider>(),
        child: BlocBuilder<ThemeProvider, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConfig.of(context).flavor.title,
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
