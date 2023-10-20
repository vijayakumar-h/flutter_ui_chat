// import 'package:flutter_ui_chat/src/common_url_services.dart';
//
// class PostScreen extends StatefulWidget {
//   const PostScreen({super.key});
//
//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }
//
// class _PostScreenState extends State<PostScreen> {
//   TextEditingController idController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController bodyController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> list = {
//       "Id": idController,
//       "Title": titleController,
//       "Body": bodyController,
//     };
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Post Data screen"),
//       ),
//       body: Column(
//         children: [
//           ...list.entries.map(
//             (e) => Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: TextField(
//                 controller: e.value as TextEditingController,
//                 decoration: InputDecoration(
//                   labelText: e.key,
//                   enabledBorder: const OutlineInputBorder(),
//                   border: const OutlineInputBorder(),
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               userController
//                   .postData(idController.hashCode, titleController.text,
//                       bodyController.text)
//                   .whenComplete(() => setState(() {}));
//             },
//             child: const Text("Post Data"),
//           ),
//         ],
//       ),
//     );
//   }
// }
