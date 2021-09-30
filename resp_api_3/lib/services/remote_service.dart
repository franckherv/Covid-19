//import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:resp_api_3/models/caroussel.dart';

class RemoteService {
  static var client = http.Client();

  static Future<dynamic> fetchCarouselData() async {
    try {
      var url =
          Uri.parse("https://my-grocery-strapi.herokuapp.com/home-carousels");

      var response = await client.get(url);
      if (response.statusCode == 200) {
        return carouselFromJson(response.body);
      }
      return null;
    } catch (e) {
      print("error $e");
      throw (e);
    }
  }
}
