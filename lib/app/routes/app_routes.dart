import 'package:sailor/sailor.dart';

import '../features/feature/presentation/index.dart';

part 'app_pages.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
      name: Pages.SPLASH,
      builder: (context, args, params) {
        return LoadingView();
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
