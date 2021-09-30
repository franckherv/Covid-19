import 'package:crud_app/constants/common_variable.dart';
import 'package:crud_app/models/user_model.dart';
import 'package:dio/dio.dart';

class HttpGlobalDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: CommonVariable.apiUrl, headers: {
    "Accept": "application/json",
    "app-id": "614f4240aaaf450dcb87a2ea",
  }));

  Future<List<Users>> getUserValue() async {
    try {
      Response response = await dio.get("user");
      return (response.data["data"] as List)
          .map((res) => Users.fromJson(res))
          .toList();
    } catch (e, strack) {
      print("===${e.response}===== ##$strack");
      throw Exception("$e");
    }
  }
  

  Future<Users> getSingleUser({String userID}) async {
    try {
      Response response = await dio.get("user/$userID");
      return Users.fromJson(response.data);
    } catch (e) {
      print("===${e.response}=====");
      throw Exception("$e");
    }
  }

  Future<Users> sendUser(
      {String firstName, String lastName, String email, }) async {
    try {
      var userData = {
        
        'firstName': firstName,
        'lastName': lastName,
        'email': email
      };
      Response response = await dio.post("user/create", data: userData);
      return Users.fromJson(response.data);
    } catch (e, strack) {
      print("===${e.response}===== ##$strack");
      throw Exception("$e");
    }
  }
}
