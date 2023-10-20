

import 'package:flutter_ui_chat/src/common_url_services.dart';

class TodoGetScreen extends StatefulWidget {
  const TodoGetScreen({super.key});

  @override
  State<TodoGetScreen> createState() => _TodoGetScreenState();
}

class _TodoGetScreenState extends State<TodoGetScreen> {
  @override
  Widget build(BuildContext context) {
    todoController.getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("T O D O"),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(
        future: todoController.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(snapshot.data![index].description),
                    leading: GestureDetector(
                      onTap: () {
                        todoController.deleteTodo(snapshot.data![index].id).whenComplete(() => setState((){}));
                      },
                      child: const Icon(Icons.delete),
                    ),
                  );
                });
          }
          return const Text("Error");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TodoPostData()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
