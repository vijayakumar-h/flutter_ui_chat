import 'dart:io';
import 'package:flutter_ui_chat/src/common_url_services.dart';
import 'package:http/http.dart' as http;

class TaskController {
  String get baseUrl {
    if (Platform.isAndroid) {
      return "http://10.0.2.2:8000/tasks";
    }
    return "http://127.0.0.1:8000/tasks";
  }

  Future<List<Task>> fetchTask() async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final List<dynamic> result = json.decode(response.body);
        return result
            .map((e) => Task.formJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching tasks: $e');
    }
  }

  Future<void> createTask(Task task) async {
    try {
      final response = await http
          .post(
            Uri.parse(baseUrl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(task.toJson()),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to create task: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating task: $e');
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      final response = await http
          .delete(Uri.parse('$baseUrl/$id'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete task: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting task: $e');
    }
  }
}
