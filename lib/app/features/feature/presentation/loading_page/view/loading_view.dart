import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate_project/localization/app_localizations.dart';

import '../controller/index.dart';

import '../../../../../../di/injector.dart';

import '../../../../../core/widgets/index.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<LoadingViewController>()..loadAppData(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).translate(LOADING),
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 40.0),
            BlocBuilder<LoadingViewController, LoadingState>(
              builder: (context, state) {
                return state.when(
                  loading: () => LoadingWidget(),
                  error: (failure) => Text(
                    failure.message,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
