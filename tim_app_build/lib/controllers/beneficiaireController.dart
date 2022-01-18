
import 'package:get/get.dart';
import 'package:tim_app_build/model/beneficiaire_model.dart';

class BeneficiaireController extends GetxController {
  Beneficiaire? beneficiairedecaissement = null;
  List<Beneficiaire>? beneficiairedecaissements = [];

  setBeneficiaire(Beneficiaire beneficiaireutilisateur) {
    this.beneficiairedecaissement = beneficiaireutilisateur;
  }

  setListBeneficiaire(List<Beneficiaire> beneficiairedecaissements) {
    this.beneficiairedecaissements = beneficiairedecaissements;
  }

  getLibelleBeneficiaire(String id) {
    var beneficiaire = this
        .beneficiairedecaissements!
        .firstWhere((element) => element.idBeneficiaire == id);
    return beneficiaire.nom;
  }
}
