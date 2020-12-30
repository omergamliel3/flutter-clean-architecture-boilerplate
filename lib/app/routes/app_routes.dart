import 'package:sailor/sailor.dart';

// Navigation Example: Routes.sailor.navigate(Pages.HOME);

abstract class Pages {
  static const HOME = '/home';
  static const SPLASH = '/splash';
}

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
      name: Pages.SPLASH,
      builder: (context, args, params) {
        return null;
      },
    ));
    sailor.addRoute(SailorRoute(
      name: Pages.HOME,
      builder: (context, args, params) {
        return null;
      },
    ));
  }
}
