// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:tim_app_build/config/variable_environnement.dart';
// import 'package:tim_app_build/controllers/decaissementController.dart';
// import 'package:tim_app_build/controllers/userController.dart';
// import 'package:tim_app_build/model/decaissement.dart';

// Future<List<Decaissement>> fetchDecaissement(int idStatut) async {
//   final decaissementController = Get.put(DecaissementController());
//   final userController = Get.put(UserController());

//   final response = await http.get(Uri.parse(VariableEnvironnement().apiBaseUrl +
//       'DecaissementController.php?Action=AllByStatut&IdStatut=' +
//       idStatut.toString() +
//       '&Idusrcreation=' +
//       userController.user!.idUtilisateur));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     var list = decaissementFromJson(response.body);
//     decaissementController.setListDecaissement(list);

//     return list;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load decaissement');
//   }
// }



// Future<Decaissement> createDecaissement(
//     String IdMtf,
//     String Beneficiaire,
//     String Montant,
//     DateTime Daterealisation,
//     String Idusrcreation,
//     List photos) async {
//   final decaissementController = Get.put(DecaissementController());
//   final userController = Get.put(UserController());

//   final response = await http.post(
//       Uri.parse(VariableEnvironnement().apiBaseUrl +
//           "StatutController.php?Action=Add" +
//           userController.user!.idUtilisateur),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'IdMtf': IdMtf,
//         'IdBnf': Beneficiaire,
//         'Montant': Montant,
//         'Daterealisation': Daterealisation.toIso8601String(),
//         'Idusrcreation': Idusrcreation,
//         'Photo': photos.toString(),
//       }));
//   if (response.statusCode == 200) {
//     var list = decaissementFromJson(response.body);
//     decaissementController.setListDecaissement(list);

//     return Decaissement.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to initié');
//   }
// }

// Future<Decaissement> deleteDecaissement(String idDecaissement) async {
//   final http.Response response = await http.delete(
//     Uri.parse(VariableEnvironnement().apiBaseUrl +
//         'DecaissementController.php?Action=Geler&IdDecaissement=2'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Charset': 'utf-8',
//       'Authorization': 'token'
//     },
//   );

//   if (response.statusCode == 200) {
//     return Decaissement.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to delete album.');
//   }
// }









import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tim_app_build/config/variable_environnement.dart';
import 'package:tim_app_build/controllers/beneficiaireController.dart';
import 'package:tim_app_build/controllers/decaissementController.dart';
import 'package:tim_app_build/controllers/motifController.dart';
import 'package:tim_app_build/controllers/userController.dart';
import 'package:tim_app_build/model/decaissement.dart';

Future<List<Decaissement>> fetchDecaissement(int idStatut) async {
  final decaissementController = Get.put(DecaissementController());
  final userController = Get.put(UserController());

  final response = await http.get(Uri.parse(VariableEnvironnement().apiBaseUrl +
      'DecaissementController.php?Action=AllByStatut&IdStatut=' +
      idStatut.toString() +
      '&Idusrcreation=' +
      userController.user!.idUtilisateur));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var list = decaissementFromJson(response.body);
    decaissementController.setListDecaissement(list);

    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load decaissement');
  }
}

// Créer un decaissement

Future<bool> InitierDecaissement(String IdMtf, String IdBnf, String Montant,
    DateTime Daterealisation, String Commentaire, List photos) async {
  final decaissementController = Get.put(DecaissementController());
  final userController = Get.put(UserController());
  final motifController = Get.put(MotifController());
  final beneficiaireController = Get.put(BeneficiaireController());

  final response = await http.post(
      Uri.parse(VariableEnvironnement().apiBaseUrl +
          "DecaissementStatutController.php?Action=Add"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        "Access-Control-Allow-Origin": "*",
      },
      body: {
        'IdMtf': IdMtf,
        'IdBnf': IdBnf,
        'Montant': Montant,
        'DateRealisation': Daterealisation.toIso8601String(),
        'Idusrcreation': userController.user!.idUtilisateur,
        'Commentaire': Commentaire,
        // 'ListePhoto': photos
      });
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    var body = json.decode(response.body);
    if (body["Etat"] != null && body["Etat"] == "SUCCES") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to initie');
  }
}

// Supprimer un decaissement
Future<List<Decaissement>> deleteDecaissement(String idDecaissement) async {
  final http.Response response = await http.delete(
    Uri.parse(VariableEnvironnement().apiBaseUrl +
        'DecaissementController.php?Action=Geler&IdDecaissement=' +
        idDecaissement),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
    },
  );

  if (response.statusCode == 200) {
    return [];
  } else {
    throw Exception('Failed to delete decaissement.');
  }
}

//Publier un decaissement
Future<List<Decaissement>> publierDecaissement(
    Decaissement decaissement) async {
  final userController = Get.put(UserController());

  final http.Response response = await http.post(
    Uri.parse(
        VariableEnvironnement().apiBaseUrl + 'StatutController.php?Action=Add'),
    body: {
      "IdTypeStatut": "2",
      "IdDecaissement": decaissement.idDecaissement,
      "Empty1": userController.user!.email,
      "Empty2": decaissement.montant,
      "Empty3": decaissement.numeroDecaissement,
      "Empty4": decaissement.dateRealisation,
      "Empty5": decaissement.commentaire,
      "Empty6": userController.user!.nom + ' ' + userController.user!.prenom,
      "IdUtilisateurCreation": userController.user!.idUtilisateur
    },
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
    },
  );
  if (response.statusCode == 200) {
    return fetchDecaissement(1);
  } else {
    throw Exception('Failed to publish decaissement');
  }
}

//Valider un decaissement
Future<List<Decaissement>> validerDecaissement(
    Decaissement decaissement) async {
  final userController = Get.put(UserController());

  final http.Response response = await http.post(
    Uri.parse(
        VariableEnvironnement().apiBaseUrl + 'StatutController.php?Action=Add'),
    body: {
      "IdTypeStatut": "3",
      "IdDecaissement": decaissement.idDecaissement,
      "Empty1": userController.user!.email,
      "Empty2": decaissement.montant,
      "Empty3": decaissement.numeroDecaissement,
      "Empty4": decaissement.dateRealisation,
      "Empty5": decaissement.commentaireStatut,
      "Empty6": userController.user!.nom + ' ' + userController.user!.prenom,
      "IdUtilisateurCreation": userController.user!.idUtilisateur
    },
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
    },
  );
  if (response.statusCode == 200) {
    return fetchDecaissement(1);
  } else {
    throw Exception('Failed to publish decaissement');
  }
}

// Refuser un décaissement
Future<List<Decaissement>> refuserDecaissement(
    Decaissement decaissement) async {
  final userController = Get.put(UserController());

  final http.Response response = await http.post(
    Uri.parse(
        VariableEnvironnement().apiBaseUrl + 'StatutController.php?Action=Add'),
    body: {
      "IdTypeStatut": "4",
      "IdDecaissement": decaissement.idDecaissement,
      "Empty1": userController.user!.email,
      "Empty2": decaissement.montant,
      "Empty3": decaissement.numeroDecaissement,
      "Empty4": decaissement.dateRealisation,
      "Empty5": decaissement.commentaireStatut,
      "Empty6": userController.user!.nom + ' ' + userController.user!.prenom,
      "IdUtilisateurCreation": userController.user!.idUtilisateur
    },
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
    },
  );
  if (response.statusCode == 200) {
    return fetchDecaissement(1);
  } else {
    throw Exception('Failed to publish decaissement');
  }
}

// Relancer un decaissement

Future<List<Decaissement>> relancerDecaissement(
    Decaissement decaissement) async {
  final userController = Get.put(UserController());

  final http.Response response = await http.post(
    Uri.parse(
        VariableEnvironnement().apiBaseUrl + 'StatutController.php?Action=Add'),
    body: {
      "IdTypeStatut": "2",
      "IdDecaissement": decaissement.idDecaissement,
      "Empty1": userController.user!.email,
      "Empty2": decaissement.montant,
      "Empty3": decaissement.numeroDecaissement,
      "Empty4": decaissement.dateRealisation,
      "Empty5": decaissement.commentaire,
      "Empty6": userController.user!.nom + ' ' + userController.user!.prenom,
      "IdUtilisateurCreation": userController.user!.idUtilisateur
    },
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
    },
  );
  if (response.statusCode == 200) {
    return fetchDecaissement(1);
  } else {
    throw Exception('Failed to republish decaissement');
  }
}

Future<bool> motifRefusDecaissement(
  // String IdTypeStatut,
  // String IdDecaissement,
  // String Empty1,
  // String montant,
//  String numeroDecaissement,
  // String dateRealisation,
  String commentaireStatut,
  // String Empty6,
  // String IdUtilisateurCreation,
  // String CommentaireStatut,
) async {
  final decaissementController = Get.put(DecaissementController());
  final userController = Get.put(UserController());
  final motifController = Get.put(MotifController());
  final beneficiaireController = Get.put(BeneficiaireController());

  final response = await http.post(
      Uri.parse(VariableEnvironnement().apiBaseUrl +
          "DecaissementStatutController.php?Action=Add"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        "Access-Control-Allow-Origin": "*",
      },
      body: {
        "IdTypeStatut": "4",
        //"IdDecaissement": IdDecaissement,
        //"Empty1": userController.user!.email,
        //"Empty2": montant,
        //"Empty3": numeroDecaissement,
        // "Empty4": dateRealisation,
        "CommentaireStatut": commentaireStatut,
        //"Empty6": userController.user!.nom + ' ' + userController.user!.prenom,
        // "IdUtilisateurCreation": userController.user!.idUtilisateur
      });
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    var body = json.decode(response.body);
    if (body["Etat"] != null && body["Etat"] == "SUCCES") {
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to initie');
  }
}
