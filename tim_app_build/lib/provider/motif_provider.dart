
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_app_build/controllers/motifController.dart';
import 'package:tim_app_build/model/motif.dart';

class Motifs with ChangeNotifier {
  final motifController = Get.put(MotifController());
  List<Motif> motifdecaissements = [];
  Motif findById(String idMotif) {
    return motifController.motifdecaissements!.firstWhere(
      (mtf) => mtf.idMotif == idMotif,
    );
  }
}
