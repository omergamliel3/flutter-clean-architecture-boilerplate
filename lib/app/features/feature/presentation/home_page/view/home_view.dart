import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate_project/injector.dart';

import '../controller/cubit_controller.dart';
import '../controller/state.dart';

import '../../../../../core/widgets/loading_widget.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('HomePage'),
    );
  }

  Widget buildBody(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.headline4.copyWith(color: Colors.white);

    return BlocBuilder<HomeViewController, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
              child: Text(
            'Initial State',
            style: textStyle,
          )),
          loading: () => LoadingWidget(),
          success: (connection) => Center(
            child: Text(
              'Success State\nConnection: $connection',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          error: (failure) => Center(
            child: Text(
              'Failure state\nReason: ${failure.message}',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocProvider(
        create: (_) => Injector.resolve<HomeViewController>(),
        child: Scaffold(
          appBar: appBar(),
          body: buildBody(context),
          floatingActionButton: FAB(),
        ),
      ),
    );
  }
}
