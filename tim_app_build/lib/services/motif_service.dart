
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tim_app_build/config/variable_environnement.dart';
import 'package:tim_app_build/controllers/motifController.dart';
import 'package:tim_app_build/model/motif.dart';

Future<List<Motif>> fetchMotif() async {
  final motifController = Get.put(MotifController());

  final response = await http.get(Uri.parse(
      VariableEnvironnement().apiBaseUrl + '/motifController.php?Action=All'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var listmotif = motifFromJson(response.body);
    motifController.setListMotif(listmotif);

    return listmotif;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load motif');
  }
}
