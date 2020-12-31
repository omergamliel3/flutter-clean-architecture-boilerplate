import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';

class ThemeProvider extends Cubit<ThemeState> {
  ThemeProvider() : super(const System());

  // emits light theme data
  void toggleLightTheme() {
    emit(const Light());
  }

  // emits dark theme data
  void toggleDarkTheme() {
    emit(const Dark());
  }

  // emits system theme data
  void toggleSystemTheme() {
    emit(const System());
  }
}
