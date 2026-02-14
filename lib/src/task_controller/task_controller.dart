import 'package:flutter_ui_chat/src/common_url_services.dart';
import 'package:http/http.dart' as http;

class TaskController {
  final String baseUrl = "http://10.0.2.2:8000/tasks";

  Future<List<Task>> fetchTask() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<Task> result = json.decode(response.body);
      return result
          .map((e) => Task.formJson(e as Map<String, dynamic>))
          .toList();
    }

    throw Exception('Failed to fetch tasks');
  }

  Future<void> createTask(Task task) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(task.toJson())
    );
    if (response.statusCode == 200) {

    }
  }
}
