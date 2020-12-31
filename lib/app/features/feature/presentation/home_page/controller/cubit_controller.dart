import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/network/network_info.dart';

class HomeViewController extends Cubit<HomeState> {
  HomeViewController(this.networkInfo) : super(const Initial());

  NetworkInfoI networkInfo;

  Future<void> checkConnectivity() async {
    emit(const Loading());
    await Future.delayed(const Duration(seconds: 2));
    final connectivity = await networkInfo.isConnected();
    final result = await networkInfo.connectivityResult;
    if (connectivity) {
      emit(Success(result.toString()));
    } else {
      emit(Error(Failure(result.toString())));
      waitForConnectivityAndCallGetArticles();
    }
  }

  void waitForConnectivityAndCallGetArticles() {
    StreamSubscription subscription;
    subscription = networkInfo.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        subscription.cancel();
        checkConnectivity();
      }
    });
  }
}
