import 'package:kiwi/kiwi.dart';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import '../app/core/network/network_info.dart';
import '../app/features/feature/data/api/api.dart';

import '../app/theme/theme_provider.dart';

import '../app/features/feature/presentation/home_page/controller/cubit_controller.dart';
import '../app/features/feature/presentation/loading_page/controller/cubit_controller.dart';

import 'package:flutter_boilerplate_project/app/core/services/location.dart';
import 'package:flutter_boilerplate_project/app/core/services/prefs.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container;

  static final resolve = container.resolve;

  static void setup() {
    _$Injector()._configure();
  }

  //! must run before setup()
  static Future<void> setupAsync() async {
    container = KiwiContainer();
    final prefs = Prefs();
    await prefs.initPrefs();
    container.registerInstance(prefs);
  }

  void _configure() {
    _configureCore();
    _configureFeatureModule();
  }

  // Core module
  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfoI, from: NetworkInfo)
  @Register.singleton(ThemeProvider)
  @Register.singleton(LocationServiceI, from: LocationService)
  void _configureCore();

  // Feature module
  void _configureFeatureModule() {
    _configureFeatureModuleInstances();
    _configureFeatureModuleFactories();
  }

  // Register Feature module Instances
  void _configureFeatureModuleInstances() {
    container.registerInstance(RestClient(Dio()));
  }

  // Register Feature module Factories
  @Register.factory(LoadingViewController)
  @Register.factory(HomeViewController)
  void _configureFeatureModuleFactories();
}
