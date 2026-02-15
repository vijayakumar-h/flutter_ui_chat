import 'package:flutter_ui_chat/src/bloc.dart';
import 'package:flutter_ui_chat/src/common_url_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskController(),
      child: BlocProvider(
        create: (context) => TaskBloc(context.read<TaskController>())..add(LoadTask()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
      ),
    );
  }
}
