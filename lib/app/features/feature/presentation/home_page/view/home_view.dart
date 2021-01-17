import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate_project/di/injector.dart';
import 'package:flutter_boilerplate_project/localization/app_localizations.dart';

import '../controller/index.dart';

import '../../../../../core/widgets/loading_widget.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context).translate(APP_TITLE)),
    );
  }

  Widget buildBody(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline4;
    final initialText = AppLocalizations.of(context).translate(INITIAL_STATE);
    final successText = AppLocalizations.of(context).translate(SUCCESS_STATE);
    final failureText = AppLocalizations.of(context).translate(FAILURE_STATE);
    final connectionText = AppLocalizations.of(context).translate(CONNECTION);
    final reasonText = AppLocalizations.of(context).translate(REASON);

    return BlocBuilder<HomeViewController, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
              child: Text(
            initialText,
            style: textStyle,
          )),
          loading: () => LoadingWidget(),
          success: (connection) => Center(
            child: Text(
              '$successText\n$connectionText: $connection',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          error: (failure) => Center(
            child: Text(
              '$failureText\n$reasonText: ${failure.message}',
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
