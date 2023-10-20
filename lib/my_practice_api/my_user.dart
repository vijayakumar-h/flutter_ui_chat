// // import 'package:flutter_ui_chat/my_practice_api/post_screen.dart';
// // import 'package:flutter_ui_chat/src/common_url_services.dart';
// //
// // class MyScreen extends StatelessWidget {
// //   const MyScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("My Screen"),
// //       ),
// //       body: FutureBuilder(
// //         future: userController.fetchData(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //           if (snapshot.connectionState == ConnectionState.done) {
// //             return ListView.builder(
// //                 itemCount: snapshot.data!.length,
// //                 itemBuilder: (context, index) {
// //                   return ListTile(
// //                     title: Text(snapshot.data![index].title, maxLines: 1),
// //                     subtitle: Text(snapshot.data![index].body, maxLines: 3),
// //                     leading: CircleAvatar(
// //                       child: Text(snapshot.data![index].id.toString()),
// //                     ),
// //                   );
// //                 });
// //           }
// //           return const Text("No Data");
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(context,
// //               MaterialPageRoute(builder: (context) => const PostScreen()));
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter_ui_chat/src/common_url_services.dart';
//
// class MyScreen extends StatelessWidget {
//   const MyScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("API screen"),
//       ),
//       body: FutureBuilder(future: null, builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         return
//       },),
//     );
//   }
// }
