// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Post {
//   final String title;
//   final String body;

//   Post(this.title, this.body);
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final SearchBarController<Post> _searchBarController = SearchBarController();
//   bool isReplay = false;

//   List<Post> fooList = [
//     Post('one', '1'),
//     Post('two', '2'),
//     Post('three', '3'),
//     Post('four', '4'),
//     Post('five', '5')
//   ];

//   Future<List<Post>> _getALlPosts(String text) async {
//     List<Post> posts = fooList
//         .where((element) =>
//             element.title.contains(text) || element.body.contains(text))
//         .toList();
//     return posts;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SearchBar<Post>(
//           minimumChars: 1,
//           searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
//           headerPadding: EdgeInsets.symmetric(horizontal: 10),
//           listPadding: EdgeInsets.symmetric(horizontal: 10),
//           onSearch: _getALlPosts,
//           searchBarController: _searchBarController,
//           placeHolder: Center(
//               child: Text(
//             "PlaceHolder",
//             style: TextStyle(fontSize: 30),
//           )),
//           cancellationWidget: Text("Cancel"),
//           emptyWidget: Text("empty"),
//           onCancelled: () {
//             print("Cancelled triggered");
//           },
//           mainAxisSpacing: 10,
//           onItemFound: (Post post, int index) {
//             return Container(
//               color: Colors.lightBlue,
//               child: ListTile(
//                 title: Text(post.title),
//                 isThreeLine: true,
//                 subtitle: Text(post.body),
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) => Detail()));
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Detail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             Text("Detail"),
//           ],
//         ),
//       ),
//     );
//   }
// }
