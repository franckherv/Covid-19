import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_app_build/controllers/beneficiaireController.dart';
import 'package:tim_app_build/model/beneficiaire_model.dart';

class Beneficiaires with ChangeNotifier {
  final beneficiaireController = Get.put(BeneficiaireController());
  List<Beneficiaire> motifdecaissements = [];
  Beneficiaire findById(String idBeneficiaire) {
    return beneficiaireController.beneficiairedecaissements!.firstWhere(
      (benef) => benef.idBeneficiaire == idBeneficiaire,
    );
  }
}
