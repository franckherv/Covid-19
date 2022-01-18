import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tim_app_build/config/variable_environnement.dart';
import 'package:tim_app_build/controllers/beneficiaireController.dart';
import 'package:tim_app_build/model/beneficiaire_model.dart';

Future<List<Beneficiaire>> fetchBeneficiaire() async {
  final beneficiaireController = Get.put(BeneficiaireController());

  final response = await http.get(Uri.parse(VariableEnvironnement().apiBaseUrl +
      '/BeneficiaireController.php?Action=All'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var listbeneficiaire = beneficiaireFromJson(response.body);
    beneficiaireController.setListBeneficiaire(listbeneficiaire);

    return listbeneficiaire;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load beneficiaire');
  }
}
