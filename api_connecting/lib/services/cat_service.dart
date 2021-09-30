import 'package:api_connecting/models/cat_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatService {
  Future<Cat> fetchCat() async {
    var url = Uri.parse('https://thatcopy.pw/catapi/rest/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      var data = Cat.fromJson(decode); // mappage
      return data;
    } else {
      throw Exception('Erreur...');
    }
  }
}
