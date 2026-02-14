import 'package:flutter_ui_chat/src/common_url_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('TODO app'),
        ),
        body: Column(
          children: [],
        ),
      );
}
