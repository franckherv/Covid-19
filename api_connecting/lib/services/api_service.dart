import 'package:api_connecting/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<Users>> getuserData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Users> data =
          body.map((dynamic user) => Users.fromJson(user)).toList();

      return data;
    } else {
      throw Exception("Erreur");
    }
  }
}
