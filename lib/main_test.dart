import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_project/config/app_config.dart';
import 'package:flutter_boilerplate_project/config/build_flavor.dart';
import 'package:flutter_boilerplate_project/main.dart';

import 'app/routes/app_routes.dart';
import 'di/injector.dart';

Future<void> main() async {
  final appConfig = AppConfig(
    flavor: Test(),
    app: MyApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setupAsync();
  Injector.setup();
  Routes.createRoutes();
  return runApp(appConfig);
}
