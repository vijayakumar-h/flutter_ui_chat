// import 'dart:convert';
//
// import 'package:flutter_ui_chat/my_practice_api/model/my_user_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

//
// class UserController {
//   factory UserController() => _singleton;
//   static final UserController _singleton = UserController.internal();
//
//   List<User> users = [];
//
//   UserController.internal();
//
//   Future<List<User>> fetchData() async {
//     final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       users = data.map((e) => User.fromJson(e)).toList();
//       return users;
//     } else {
//       throw Exception("No data found");
//     }
//   }
//
//   Future<void> postData(int id, String title, String bodies) async {
//     final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     final body =
//         jsonEncode(<String, dynamic>{"id": id, "title": title, "body": bodies});
//     final response = await http.post(url, body: body);
//     if (response.statusCode == 201) {
//       print("response.statusCode");
//       print(response.statusCode);
//       print(response.body);
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       final User user = User.fromJson(data);
//       users.add(user);
//       print(users.length);
//     } else {
//       throw Exception("No data Found");
//     }
//   }
// }

import 'package:flutter_ui_chat/my_practice_api/model/my_user_model.dart';

class UserController {
  factory UserController() => _singleton;
  static final UserController _singleton = UserController.internal();

  List<User> users = [];

  UserController.internal();

  Future<List<User>> getData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      users = data.map((e) => User.fromJson(e)).toList();
      return users;
    } else {
      throw Exception('No data fiound');
    }
  }
}
