import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/services/prefs.dart';

import 'theme_state.dart';

const THEME_KEY = 'Theme';
const LIGHT_THEME = 'Light';
const DARK_THEME = 'Dark';
const SYSTEM_THEME = null;

class ThemeProvider extends Cubit<ThemeState> {
  ThemeProvider(this._prefs)
      : super(_prefs.instance.getString(THEME_KEY) == SYSTEM_THEME
            ? const System()
            : _prefs.instance.getString(THEME_KEY) == LIGHT_THEME
                ? const Light()
                : const Dark());

  final Prefs _prefs;

  // emits light theme data
  void toggleLightTheme() {
    if (state is Light) {
      print('Theme Mode is already Light');
    } else {
      _prefs.instance.setString(THEME_KEY, LIGHT_THEME);
      emit(const Light());
    }
  }

  // emits dark theme data
  void toggleDarkTheme() {
    if (state is Dark) {
      print('Theme Mode is already Dark');
    } else {
      _prefs.instance.setString(THEME_KEY, DARK_THEME);
      emit(const Dark());
    }
  }

  // emits system theme data
  void toggleSystemTheme() {
    if (state is System) {
      print('Theme Mode is already System');
    } else {
      _prefs.instance.setString(THEME_KEY, null);
      emit(const System());
    }
  }
}
