import 'package:sailor/sailor.dart';
import '../features/feature/presentation/index.dart';

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
        return HomeView();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: Pages.HOME,
      builder: (context, args, params) {
        return HomeView();
      },
    ));
  }
}
