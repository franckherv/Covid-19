import 'package:intl/intl.dart';
import 'package:yvo_resp_api_learning/models/user_model.dart';

class CommonVariable {

  static final apiBaseUrl = "https://dummyapi.io/data/v1/";
  
  //static final baseUrl = "https://fakestoreapi.com/users/1";
  static final serverImgUrl = "images/siteweb/show/";

  
  static String userTken;
  static String setglobalOneSignalPlayerId;
  static UserModel localUserDatas;

  static final ddMMYYFormat = new DateFormat('dd-MM-yyyy');
  static final hhMMFormat = new DateFormat('h:m');

}