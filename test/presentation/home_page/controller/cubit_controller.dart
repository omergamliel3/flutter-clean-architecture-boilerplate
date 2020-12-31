import 'package:connectivity/connectivity.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_boilerplate_project/app/core/network/network_info.dart';
import 'package:flutter_boilerplate_project/app/features/feature/presentation/home_page/controller/cubit_controller.dart';
import 'package:flutter_boilerplate_project/app/features/feature/presentation/home_page/controller/state.dart';

class MockNetworkInfo extends Mock implements NetworkInfoI {}

void main() {
  NetworkInfoI networkInfo;

  HomeViewController cubitController;

  setUp(() {
    networkInfo = MockNetworkInfo();
    cubitController = HomeViewController(networkInfo);
  });
  group('is online', () {
    blocTest<HomeViewController, HomeState>(
      'should emits [Loading, Success] when cubit.checkConnectivity is called succesfuly.',
      build: () {
        when(networkInfo.isConnected())
            .thenAnswer((realInvocation) => Future.value(true));
        when(networkInfo.connectivityResult).thenAnswer(
            (realInvocation) => Future.value(ConnectivityResult.wifi));
        return cubitController;
      },
      act: (cubit) => cubit.checkConnectivity(),
      expect: [isA<Loading>(), isA<Success>()],
      verify: (_) {
        verifyInOrder(
            [networkInfo.isConnected(), networkInfo.connectivityResult]);
        verifyNoMoreInteractions(networkInfo);
      },
    );
  });

  group('is offline', () {
    blocTest<HomeViewController, HomeState>(
      'should emits [Loading, Error] when cubit.checkConnectivity is called unsuccesfuly.',
      build: () {
        when(networkInfo.isConnected())
            .thenAnswer((realInvocation) => Future.value(false));
        when(networkInfo.connectivityResult).thenAnswer(
            (realInvocation) => Future.value(ConnectivityResult.none));
        when(networkInfo.onConnectivityChanged).thenAnswer(
            (realInvocation) => Stream.fromIterable([ConnectivityResult.none]));
        return cubitController;
      },
      act: (cubit) => cubit.checkConnectivity(),
      expect: [isA<Loading>(), isA<Error>()],
      verify: (_) {
        verifyInOrder([
          networkInfo.isConnected(),
          networkInfo.connectivityResult,
          networkInfo.onConnectivityChanged
        ]);
        verifyNoMoreInteractions(networkInfo);
      },
    );
  });
}
