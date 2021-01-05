import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate_project/config/app_config.dart';

import 'package:flutter_boilerplate_project/di/injector.dart';

import '../controller/index.dart';

import '../../../../../core/widgets/loading_widget.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  PreferredSizeWidget appBar(BuildContext context) {
    final title = AppConfig.of(context).flavor.title;
    return AppBar(
      title: Text(title),
    );
  }

  Widget buildBody(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline4;

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
          appBar: appBar(context),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBody(context),
              const SizedBox(
                height: 50,
              ),
              ThemeButtons()
            ],
          ),
          floatingActionButton: FAB(),
        ),
      ),
    );
  }
}
