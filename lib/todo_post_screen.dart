import 'package:flutter_ui_chat/src/common_url_services.dart';

class TodoPostData extends StatefulWidget {
  const TodoPostData({super.key});

  @override
  State<TodoPostData> createState() => _TodoPostDataState();
}

class _TodoPostDataState extends State<TodoPostData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
            ),
            TextField(
              controller: descriptionController,
            ),
            ElevatedButton(
              onPressed: () {
                todoController
                    .postData(titleController.text, descriptionController.text)
                    .whenComplete(() => setState(() {}));
              },
              child: const Text("get data"),
            ),
          ],
        ),
      ),
    );
  }
}
