import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'build_flavor.dart';

class AppConfig extends InheritedWidget {
  final Widget app;
  final BuildFlavor flavor;

  const AppConfig({
    @required this.app,
    @required this.flavor,
  }) : super(child: app);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
