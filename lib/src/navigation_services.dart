import 'package:flutter_ui_chat/src/common_url_services.dart';

class Routes {
  static const String initialScreen = "/initialScreen";
}

class NavigationServices {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialScreen:
        return MaterialPageRoute(builder: (_) => const InitialScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Route denied for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
