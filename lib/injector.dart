import 'package:kiwi/kiwi.dart';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import 'app/core/network/network_info.dart';
import 'app/features/feature/data/api/api.dart';

import 'app/features/feature/presentation/home_page/controller/cubit_controller.dart';
import 'app/features/feature/presentation/loading_page/controller/cubit_controller.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureCore();
    _configureFeatureModule();
  }

  // Core module
  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfoI, from: NetworkInfo)
  void _configureCore();

  // Feature module
  void _configureFeatureModule() {
    _configureArticlesFeatureModuleInstances();
    _configureArticlesFeatureModuleFactories();
  }

  // Register Feature module Instances
  void _configureArticlesFeatureModuleInstances() {
    container.registerInstance(RestClient(Dio()));
  }

  // Register Feature module Factories

  @Register.factory(LoadingViewController)
  @Register.factory(HomeViewController)
  void _configureArticlesFeatureModuleFactories();
}

// Articles Feature module instances
// void _configureArticlesFeatureModuleInstances() {
//   container.registerInstance(
//       RestClient(Dio(BaseOptions(contentType: "application/json"))));
// }

// Articles Feature module factories
// @Register.factory(ArticlesRemoteDatasource)
// @Register.factory(ArticlesLocalDatasource,
//     from: ArticlesLocalDatasourceHiveImpl)
// @Register.factory(GetLocalArticles)
// @Register.factory(GetRemoteArticles)
// @Register.factory(ArticlesRepository, from: ArticlesRepositoryImpl)
// @Register.factory(ArticlesCubit)
// void _configureArticlesFeatureModuleFactories();
