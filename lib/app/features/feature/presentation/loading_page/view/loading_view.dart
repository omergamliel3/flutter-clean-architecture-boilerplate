import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate_project/app/features/feature/presentation/loading_page/controller/cubit_controller.dart';
import 'package:flutter_boilerplate_project/app/features/feature/presentation/loading_page/controller/state.dart';
import 'package:flutter_boilerplate_project/injector.dart';

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
              'Loading Page',
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
