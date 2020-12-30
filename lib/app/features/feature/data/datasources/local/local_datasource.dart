import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatasource {
  // Name constants
  final _kDbFileName = 'sembast.db';
  final _storeName = 'store';

  // Sembast database object
  Database _database;

  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are objects converted to Map
  StoreRef<int, Map<String, dynamic>> _store;

  // initialize database
  Future<bool> initDb() async {
    try {
      // Get a platform-specific directory where persistent app data can be stored
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentDir.path, _kDbFileName);
      _database = await databaseFactoryIo.openDatabase(dbPath);
      _store = intMapStoreFactory.store(_storeName);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// delete database
  Future<bool> deleteDb() async {
    try {
      // Get a platform-specific directory where persistent app data can be stored
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentDir.path, _kDbFileName);
      await databaseFactoryIo.deleteDatabase(dbPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// delete all records
  Future<bool> deleteAllRecords() async {
    try {
      await _store.delete(_database);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// save articles in database
  // Future<bool> insertArticles(List<ArticleModel> articles) async {
  //   try {
  //     // delete all articles from store
  //     await _articlesStore.delete(_database);

  //     // insert all articles to  store
  //     for (final article in articles) {
  //       await _articlesStore.add(_database, article.toJson());
  //     }
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  /// return all stored articles
  // Future<List<ArticleModel>> getArticles() async {
  //   try {
  //     final recordSnapshots = await _articlesStore.find(_database);
  //     return recordSnapshots
  //         .map((snapshot) => ArticleModel.fromJson(snapshot.value))
  //         .toList();
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
