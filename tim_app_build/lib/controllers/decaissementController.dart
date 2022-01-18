
import 'package:get/get.dart';
import 'package:tim_app_build/model/decaissement.dart';

class DecaissementController extends GetxController {
  Decaissement? decaissement = null;
  List<Decaissement>? decaissements = [];

  setDecaissement(Decaissement utilisateur) {
    this.decaissement = utilisateur;
  }

  setListDecaissement(List<Decaissement> decaissements) {
    this.decaissements = decaissements;
  }
}
