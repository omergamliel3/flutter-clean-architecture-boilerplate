import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';

import '../../../../../routes/app_routes.dart';
import '../../../../../core/errors/failure.dart';

import 'state.dart';

const ERROR_MESSAGE = 'Something went wrong while loading app data';

class LoadingViewController extends Cubit<LoadingState> {
  LoadingViewController() : super(const Loading());

  Future<void> loadAppData() async {
    // load app components
    await Future.delayed(const Duration(seconds: 3));
    final rng = Random();
    if (rng.nextInt(100) > 10) {
      // navigate to home page
      Routes.sailor
          .navigate(Pages.HOME, navigationType: NavigationType.pushReplace);
    } else {
      // emit error state
      emit(const Error(Failure(ERROR_MESSAGE)));
    }
  }
}
