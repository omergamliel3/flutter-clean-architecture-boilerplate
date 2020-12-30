import 'package:kiwi/kiwi.dart';

import 'package:connectivity/connectivity.dart';

import 'app/core/network/network_info.dart';

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
  }

  // Core module
  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfoI, from: NetworkInfo)
  void _configureCore();
}

// ARTICLES FEATURE MODULE EXAMPLE

// Articles Feature module
// void _configureArticlesFeatureModule() {
//   _configureArticlesFeatureModuleInstances();
//   _configureArticlesFeatureModuleFactories();
// }

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
