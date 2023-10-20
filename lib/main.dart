import 'package:flutter_ui_chat/slide_animation.dart';

import 'package:flutter_ui_chat/src/common_url_services.dart';

final TodoController todoController = TodoController();

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: Routes.initialScreen,
//       navigatorKey: NavigationServices.navigatorKey,
//       onGenerateRoute: NavigationServices.generateRoute,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SlideAnimationScreen(),
    );
  }
}
