import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'package:flutter_boilerplate_project/config/app_config.dart';
import 'package:flutter_boilerplate_project/config/build_flavor.dart';
import 'package:flutter_boilerplate_project/main/main.dart';

import '../app/routes/app_routes.dart';
import '../di/injector.dart';

Future<void> main() async {
  final appConfig = AppConfig(
    flavor: Prod(),
    app: MyApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setupAsync();
  Injector.setup();
  await dotenv.load();
  print(dotenv.env['FOO']);
  Routes.createRoutes();
  return runApp(appConfig);
}
