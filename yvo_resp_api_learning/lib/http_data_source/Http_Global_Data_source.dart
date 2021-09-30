
import 'package:dio/dio.dart';
import '../constants/common_variable.dart';
import '../models/user_model.dart';

class HttpGlobalDatasource {
  Dio dio = Dio(
    BaseOptions(baseUrl: CommonVariable.apiBaseUrl, headers: {
      "Accept": "application/json",
      "app-id": "614f4240aaaf450dcb87a2ea",
      "Authorization": 'Bearer ${CommonVariable.userTken}'
    }),
  );
  var token;



  // ================ get user data ================= //

  Future<List<UserModel>> getUsers() async {
    try {
      Response response = await dio.get("user");

      /* PaginationModel pagination = formatPaginagtionDatas(datas:response.data['data']);
      context.read<GlobalStateManager>().setPagination(pagination);
      */

      return (response.data["data"] as List).map((x) => UserModel.fromJson(x)).toList();

    } catch (error, stacktrace) {
      print("###error user####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  

  // ===================== get single user data =====================//

    Future<UserModel> getSingleUser({String userId}) async {
    try {
      Response response = await dio.get("user/$userId");

      /* PaginationModel pagination = formatPaginagtionDatas(datas:response.data['data']);
      context.read<GlobalStateManager>().setPagination(pagination);
      */

      return UserModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("###error user####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

 //  ===================== Request post ==========================

  Future<UserModel> addNewUser({
    String lastName,
    String firstName,
    String email,
  }) async {
    try {
      var userDatas = {
        "lastName": lastName,
        "firstName": firstName,
        "email": email
      };

      print(userDatas);

      Response response = await dio.post("user/create", data: userDatas);
      print("###response####${response.data}###");
      /* PaginationModel pagination = formatPaginagtionDatas(datas:response.data['data']);
      context.read<GlobalStateManager>().setPagination(pagination);
      */

      return UserModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("###error user####$error###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }



  //Connexion

  /*loginWithEmailDataSource({
    String email,
    String password,
    }) async {
    try {} catch (e) {}
    return dio.post('login', data: {
      "email": email,
      "password": password,
    }).then((response) {

      //return User.token(response.data);
      return Token.fromJson(response.data);
      //return "Succes";
    }).then((token) {

      CommonVariable.userTken = token.accessToken;

      return dio
          .get('me',
          options: Options(
              headers: {'Authorization': token.authorizationHeader}))
          .then((response) {
        var user = UserModel.fromJson(response.data["data"])..token = token;

          CommonVariable.localUserDatas = user;

        user.store();
        return user;
      });
    });
  }  */

/*  Future logout() async {

    try {
      Response response = await dio.post("logout");

      return response.data;

    } catch (error, stacktrace) {
      print("###error logout####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
  */

  /*Future<HomeRecapModel> getHomeRecapDatas() async {

    try {
      Response response = await dio.get("get-home-recap");
      //print("###response####${response.data['data']}###");
      return HomeRecapModel.fromJson(response.data['data']);

    } catch (error, stacktrace) {
      print("###error courant####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }*/

/*
  PaginationModel formatPaginagtionDatas({var datas}){
    var result = {
      'next_page_url': datas['next_page_url'],
      'total': datas['total'],
      'last_page': datas['last_page'],
      'current_page': datas['current_page'],
    };
    return PaginationModel.fromJson(result);
  } */

}
