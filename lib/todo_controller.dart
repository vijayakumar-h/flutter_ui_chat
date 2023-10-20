import 'package:http/http.dart' as http;
import 'package:flutter_ui_chat/src/common_url_services.dart';

class TodoController {
  factory TodoController() => _singleton;
  static final TodoController _singleton = TodoController.internal();

  TodoController.internal();

  List<Todo> todos = [];

  Future<List<Todo>> getData() async {
    final url =
        Uri.parse('https://651e48d144a3a8aa4767f7c2.mockapi.io/api/todolist');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      todos = data.map((e) => Todo.fromJson(e)).toList();
      return todos;
    } else {
      throw Exception('No data found');
    }
  }

  Future<void> postData(String title, String description) async {
    final url =
        Uri.parse('https://651e48d144a3a8aa4767f7c2.mockapi.io/api/todolist');
    // final headers = <String, String>{"Content-Type": "application/json"};
    final body = jsonEncode(
        <String, String>{"title": title, "description": description});

    print("body");
    print(body);
    final response = await http.post(
      url,
      // headers: headers,
      body: body,
    );
    print("response.statusCode");
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      final Map<String, dynamic> dataComingFromApiResponse =
          jsonDecode(response.body);

      final Todo todo = Todo.fromJson(dataComingFromApiResponse);

      todos.add(todo);

      print(todos.length);
    } else {
      throw Exception("Failed to post data");
    }
  }

  Future<void> deleteTodo(String id) async {
    final url = Uri.parse(
        'https://651e48d144a3a8aa4767f7c2.mockapi.io/api/todolist/$id');
    final body = jsonEncode(<String, String>{"title": id});
    final response = await http.delete(url, body: body);
    if (response.statusCode == 200) {
    } else {
      throw Exception('No data found');
    }
  }
}
