import 'package:dio/dio.dart';
import 'package:tim_app/constant/common_variable.dart';
import 'package:tim_app/models/model_source.dart';

class HttpGlobalDatasource {


     Dio dio = Dio(
    BaseOptions(baseUrl: CommonVariable.apiBaseUrl, headers: {
      "Accept": "application/json",
      "app-id": "aa1562e2fb914bcb96f10a0a70755505",
     // "Authorization": 'Bearer ${CommonVariable.userTken}'
    }),
  );
  var token;



  // ================ get user data ================= //

  Future<List<Article>> getUsers() async {
    try {
      Response response = await dio.get("everything?q=tesla&from=2021-11-05&sortBy=publishedAt&apiKey=aa1562e2fb914bcb96f10a0a70755505");

      /* PaginationModel pagination = formatPaginagtionDatas(datas:response.data['data']);
      context.read<GlobalStateManager>().setPagination(pagination);
      */

      return (response.data["articles"] as List).map((x) => Article.fromJson(x)).toList();

    } catch (error, stacktrace) {
      print("###error user####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

   }
  
  
  