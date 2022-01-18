// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:collection/collection.dart';
// import 'package:get/get.dart';
// import 'package:tim_app_build/controllers/decaissementController.dart';
// import 'package:tim_app_build/model/decaissement.dart';

// class Decaissements with ChangeNotifier {
//   final decaissementController = Get.put(DecaissementController());
//   List<Decaissement> decaissements = [];

//   // List<Decaissement> _items = [];
//   // List<Decaissement> get items => [..._items];

//   Decaissement findById(
//     String idDecaissement,
//   ) {
//     return decaissementController.decaissements!.firstWhere(
//       (decs) => decs.idDecaissement == idDecaissement,
//     );
//   }

//   String _searchString = "";

//   UnmodifiableListView<Decaissement> get decs => _searchString.isEmpty
//       ? UnmodifiableListView(decaissements)
//       : UnmodifiableListView(decaissements.where(
//           (dec) => dec.beneficiaire!.toLowerCase().contains(_searchString)));

//   void changeSearchString(String searchString) {
//     _searchString = searchString;
//     print(_searchString);
//     notifyListeners();
//   }

//   void addDecaissement(Decaissement decaissement) {
//     final newDecaissement = Decaissement(
//       idDecaissement: decaissement.idDecaissement,
//       idMtf: decaissement.idMtf,
//       idBnf: decaissement.idBnf,
//       numeroDecaissement: decaissement.numeroDecaissement,
//       numeroPiece: decaissement.numeroPiece,
//       montant: decaissement.montant,
//       beneficiaire: decaissement.beneficiaire,
//       numeroBeneficiaire: decaissement.numeroBeneficiaire,
//       commentaire: decaissement.commentaire,
//       dateRealisation: decaissement.dateRealisation,
//       photos: decaissement.photos,
//       datecreation: decaissement.datecreation,
//       idusrcreation: decaissement.idusrcreation,
//       idusrcreationStatut: decaissement.idusrcreationStatut,
//       commentaireStatut: decaissement.commentaireStatut,
//       datecreationStatut: decaissement.idusrcreation,
//     );
//     decaissements.add(newDecaissement);
//     notifyListeners();
//   }

//   void deleteDecaissement(String idDecaissement) {
//     decaissements.removeWhere((decs) => decs.idDecaissement == idDecaissement);
//     notifyListeners();
//   }

//   void updateDecaissement(String idDecaissement, Decaissement newDecaissement) {
//     final personIndex = decaissements
//         .indexWhere((elem) => elem.idDecaissement == idDecaissement);

//     if (personIndex >= 0) {
//       decaissements[personIndex] = newDecaissement;
//       notifyListeners();
//     }
//   }
// }



import 'dart:collection';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tim_app_build/controllers/decaissementController.dart';
import 'package:tim_app_build/model/decaissement.dart';

class Decaissements with ChangeNotifier {
  final decaissementController = Get.put(DecaissementController());
  List<Decaissement> decaissements = [];
  List<Decaissement> _items = [];
  List<Decaissement> get items => [..._items];

  Decaissement findById(
    String idDecaissement,
  ) {
    return decaissementController.decaissements!.firstWhere(
      (decs) => decs.idDecaissement == idDecaissement,
    );
  }

  String _searchString = "";

  UnmodifiableListView<Decaissement> get decs => _searchString.isEmpty
      ? UnmodifiableListView(_items)
      : UnmodifiableListView(_items.where((dec) =>
          dec.numeroDecaissement!.toLowerCase().contains(_searchString)));

  void changeSearchString(String searchString) {
    _searchString = searchString;
    print(_searchString);
    notifyListeners();
  }

  void addDecaissement(Decaissement decaissement) {
    final newDecaissement = Decaissement(
      idDecaissement: decaissement.idDecaissement,
      idMtf: decaissement.idMtf,
      idBnf: decaissement.idBnf,
      numeroDecaissement: decaissement.numeroDecaissement,
      numeroPiece: decaissement.numeroPiece,
      montant: decaissement.montant,
      beneficiaire: decaissement.beneficiaire,
      numeroBeneficiaire: decaissement.numeroBeneficiaire,
      commentaire: decaissement.commentaire,
      dateRealisation: decaissement.dateRealisation,
      photos: decaissement.photos,
      datecreation: decaissement.datecreation,
      idusrcreation: decaissement.idusrcreation,
      idusrcreationStatut: decaissement.idusrcreationStatut,
      commentaireStatut: decaissement.commentaireStatut,
      datecreationStatut: decaissement.idusrcreation,
    );
    decaissements.add(newDecaissement);
    notifyListeners();
  }

  void deleteDecaissement(String idDecaissement) {
    decaissements.removeWhere((decs) => decs.idDecaissement == idDecaissement);
    notifyListeners();
  }

  void updateDecaissement(String idDecaissement, Decaissement newDecaissement) {
    final personIndex = decaissements
        .indexWhere((elem) => elem.idDecaissement == idDecaissement);

    if (personIndex >= 0) {
      decaissements[personIndex] = newDecaissement;
      notifyListeners();
    }
  }
}