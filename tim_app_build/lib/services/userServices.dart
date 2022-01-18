
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:tim_app_build/config/variable_environnement.dart';
// import 'package:tim_app_build/controllers/beneficiaireController.dart';
// import 'dart:convert';

// import 'package:tim_app_build/controllers/userController.dart';
// import 'package:tim_app_build/model/user_models.dart';
// import 'package:tim_app_build/pages/page_acceuil.dart';
// import 'package:tim_app_build/services/beneficiaire_service.dart';
// import 'package:tim_app_build/services/motif_service.dart';

// class UserService {
//   final userController = Get.put(UserController());
//   final beneficiaireController = Get.put(BeneficiaireController());

//   Future login(context, String pseudo, String motDePasse) async {
//     final response = await http.post(
//         Uri.parse(VariableEnvironnement().apiBaseUrl +
//             "UtilisateurController.php?Action=Login"),
//         body: {
//           'Pseudo': pseudo,
//           'MotDePasse': motDePasse,
//         },
//         headers: <String, String>{
//           'Content-Type': 'application/x-www-form-urlencoded',
//           "Access-Control-Allow-Origin": "*",
//         });

//     if (response.statusCode == 200) {
//       print(json.decode(response.body));
//       var body = json.decode(response.body);
//       if (body["etat"] != null && body["etat"] == "SUCCES") {
//         var user = new UserModel(
//             idUtilisateur: body["IdUtilisateur"],
//             idProfil: body["IdProfil"],
//             nom: body["Nom"],
//             prenom: body["Prenom"],
//             pseudo: body["Pseudo"],
//             email: body["Email"],
//             empty1: body["Empty1"],
//             empty2: body["Empty2"],
//             empty3: body["Empty3"],
//             datecreation: body["Datecreation"],
//             idUtilisateurCreation: body["IdUtilisateurCreation"]);
//         userController.setUser(user);
//         userController.authenticateUser();

//         // definition de variable globale
//         var beneficiaires = fetchBeneficiaire();
//         var motifs = fetchMotif();

//         // redirection vers l'acceuil

//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => PageAcceuil()));
//       } else {
//         return false;
//       }
//     } else {
//       throw Exception('Failed to login');
//     }
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tim_app_build/config/variable_environnement.dart';
import 'package:tim_app_build/controllers/beneficiaireController.dart';
import 'dart:convert';

import 'package:tim_app_build/controllers/userController.dart';
import 'package:tim_app_build/model/user_models.dart';
import 'package:tim_app_build/pages/page_acceuil.dart';
import 'package:tim_app_build/services/beneficiaire_service.dart';
import 'package:tim_app_build/services/motif_service.dart';

class UserService {
  final userController = Get.put(UserController());
  final beneficiaireController = Get.put(BeneficiaireController());

  Future login(context, String pseudo, String motDePasse) async {
    final response = await http.post(
        Uri.parse(VariableEnvironnement().apiBaseUrl +
            "UtilisateurController.php?Action=Login"),
        body: {
          'Pseudo': pseudo,
          'MotDePasse': motDePasse,
        },
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          "Access-Control-Allow-Origin": "*",
        });

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      var body = json.decode(response.body);
      if (body["etat"] != null && body["etat"] == "SUCCES") {
        var user = new UserModel(
            idUtilisateur: body["IdUtilisateur"],
            idProfil: body["IdProfil"],
            nom: body["Nom"],
            prenom: body["Prenom"],
            pseudo: body["Pseudo"],
            email: body["Email"],
            empty1: body["Empty1"],
            empty2: body["Empty2"],
            empty3: body["Empty3"],
            datecreation: body["Datecreation"],
            idUtilisateurCreation: body["IdUtilisateurCreation"]);
        userController.setUser(user);
        userController.authenticateUser();

        // definition de variable globale
        var beneficiaires = fetchBeneficiaire();
        var motifs = fetchMotif();

        // redirection vers l'acceuil

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageAcceuil()));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: new Text(
                      'pseudo ou mot de passe incorrecte, reéssayez s\'il vous plaît'),
                  actions: <Widget>[
                    TextButton(
                      child: new Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ]);
            });
      }
    }
  }
}