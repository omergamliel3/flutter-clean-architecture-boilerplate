import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_project/app/config/app_config.dart';

import 'app/routes/app_routes.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.APP_NAME,
      theme: ThemeData.light(),
      themeMode: ThemeMode.light,
      home: Container(),
      navigatorKey: Routes.sailor.navigatorKey,
      onGenerateRoute: Routes.sailor.generator(),
    );
  }
}
