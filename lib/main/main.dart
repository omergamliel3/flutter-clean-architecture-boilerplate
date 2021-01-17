import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_boilerplate_project/localization/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
              title: 'title',
              theme: lightThemeData(),
              darkTheme: darkThemeData(),
              themeMode: state.when(
                  light: () => ThemeMode.light,
                  dark: () => ThemeMode.dark,
                  system: () => ThemeMode.system),
              navigatorKey: Routes.sailor.navigatorKey,
              initialRoute: Pages.SPLASH,
              onGenerateRoute: Routes.sailor.generator(),
              supportedLocales: const [
                Locale('en', 'US'), // American English
                Locale('he', 'IL'), // Israeli Hebrew
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
            );
          },
        ));
  }
}
