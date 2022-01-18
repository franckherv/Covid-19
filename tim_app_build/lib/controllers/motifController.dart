
import 'package:get/get.dart';
import 'package:tim_app_build/model/motif.dart';

class MotifController extends GetxController {
  Motif? motifdecaissement = null;
  List<Motif>? motifdecaissements = [];

  setMotif(Motif motifutilisateur) {
    this.motifdecaissement = motifutilisateur;
  }

  setListMotif(List<Motif> motifdecaissements) {
    this.motifdecaissements = motifdecaissements;
  }

  getLibelleMotif(String id) {
    var motif =
        this.motifdecaissements!.firstWhere((element) => element.idMotif == id);
    return motif.libelle;
  }
}
