import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';

import '../../../../../routes/app_routes.dart';

import 'state.dart';

const ERROR_MESSAGE = 'Something went wrong while loading app data';

class LoadingViewController extends Cubit<LoadingState> {
  LoadingViewController() : super(const Loading());

  Future<void> loadAppData() async {
    // load app components
    await Future.delayed(const Duration(seconds: 3));
    // navigate to home page
    Routes.sailor
        .navigate(Pages.HOME, navigationType: NavigationType.pushReplace);
  }
}
