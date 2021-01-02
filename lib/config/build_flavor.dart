const APP_TITLE = 'Flutter Boilerplate Template';

abstract class BuildFlavor {
  final String title;
  BuildFlavor(this.title);
}

class Prod extends BuildFlavor {
  Prod({String title = APP_TITLE}) : super(title);
}

class Dev extends BuildFlavor {
  Dev({String title = '$APP_TITLE (Dev)'}) : super(title);
}

class Test extends BuildFlavor {
  Test({String title = '$APP_TITLE (Test)'}) : super(title);
}
