// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'Posts.dart';

// Future<Posts> fetchPosts(String num) async {
//   final response =
//   await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts/${num}"),
//   headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'pseudo': pseudo,
//       'mot de passe': motDePasse,
//   })
//   ) ;

//   if (response.statusCode == 200) {
//     return Posts.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }