// To parse this JSON data, do
//
//     final motif = motifFromJson(jsonString);

import 'dart:convert';

List<Motif> motifFromJson(String str) =>
    List<Motif>.from(json.decode(str).map((x) => Motif.fromJson(x)));

String motifToJson(List<Motif> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Motif {
  Motif({
    required this.etat,
    required this.idMotif,
    required this.libelle,
    required this.datecreation,
    required this.idusrcreation,
  });

  bool etat;
  String idMotif;
  String libelle;
  String datecreation;
  String idusrcreation;

  factory Motif.fromJson(Map<String, dynamic> json) => Motif(
        etat: json["etat"] == null ? null : json["etat"],
        idMotif: json["IdMotif"] == null ? null : json["IdMotif"],
        libelle: json["Libelle"] == null ? null : json["Libelle"],
        datecreation:
            json["Datecreation"] == null ? null : json["Datecreation"],
        idusrcreation:
            json["idusrcreation"] == null ? null : json["idusrcreation"],
      );

  Map<String, dynamic> toJson() => {
        "etat": etat == null ? null : etat,
        "IdMotif": idMotif == null ? null : idMotif,
        "Libelle": libelle == null ? null : libelle,
        "Datecreation": datecreation == null ? null : datecreation,
        "idusrcreation": idusrcreation == null ? null : idusrcreation,
      };
}
