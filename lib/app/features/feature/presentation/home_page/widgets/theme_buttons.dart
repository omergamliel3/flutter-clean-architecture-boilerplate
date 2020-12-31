import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../theme/theme_provider.dart';

class ThemeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = BlocProvider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () => themeProvider.toggleSystemTheme(),
          child: const Text('System theme'),
        ),
        const SizedBox(
          width: 6.0,
        ),
        RaisedButton(
          onPressed: () => themeProvider.toggleDarkTheme(),
          child: const Text('Dark theme'),
        ),
        const SizedBox(
          width: 6.0,
        ),
        RaisedButton(
          onPressed: () => themeProvider.toggleLightTheme(),
          child: const Text('Light theme'),
        ),
      ],
    );
  }
}
