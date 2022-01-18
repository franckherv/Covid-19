// To parse this JSON data, do
//
//     final beneficiaire = motifFromJson(jsonString);

import 'dart:convert';

List<Beneficiaire> beneficiaireFromJson(String str) => List<Beneficiaire>.from(
    json.decode(str).map((x) => Beneficiaire.fromJson(x)));

String beneficiaireToJson(List<Beneficiaire> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Beneficiaire {
  Beneficiaire({
    required this.etat,
    required this.idBeneficiaire,
    required this.nom,
    required this.idTyb,
    required this.idTyp,
    required this.telephone,
    required this.reference,
    required this.numeroPiece,
    required this.empty1,
    required this.empty2,
    required this.empty3,
    required this.datecreation,
    required this.idusrcreation,
  });

  bool etat;
  String idBeneficiaire;
  String nom;
  String idTyb;
  String idTyp;
  String telephone;
  String reference;
  String numeroPiece;
  String empty1;
  String empty2;
  String empty3;
  String datecreation;
  String idusrcreation;

  factory Beneficiaire.fromJson(Map<String, dynamic> json) => Beneficiaire(
        etat: json["etat"] == null ? null : json["etat"],
        idBeneficiaire:
            json["IdBeneficiaire"] == null ? null : json["IdBeneficiaire"],
        nom: json["Nom"] == null ? null : json["Nom"],
        idTyb: json["IdTyb"] == null ? null : json["IdTyb"],
        idTyp: json["IdTyp"] == null ? null : json["IdTyp"],
        telephone: json["Telephone"] == null ? null : json["Telephone"],
        reference: json["Reference"] == null ? null : json["Reference"],
        numeroPiece: json["NumeroPiece"] == null ? null : json["NumeroPiece"],
        empty1: json["Empty1"] == null ? null : json["Empty1"],
        empty2: json["Empty2"] == null ? null : json["Empty2"],
        empty3: json["Empty3"] == null ? null : json["Empty3"],
        datecreation:
            json["Datecreation"] == null ? null : json["Datecreation"],
        idusrcreation:
            json["Idusrcreation"] == null ? null : json["Idusrcreation"],
      );

  Map<String, dynamic> toJson() => {
        "etat": etat == null ? null : etat,
        "IdBeneficiaire": idBeneficiaire == null ? null : idBeneficiaire,
        "Nom": nom == null ? null : nom,
        "IdTyb": idTyb == null ? null : idTyb,
        "IdTyp": idTyp == null ? null : idTyp,
        "Telephone": telephone == null ? null : telephone,
        "Reference": reference == null ? null : reference,
        "NumeroPiece": numeroPiece == null ? null : numeroPiece,
        "Empty1": empty1 == null ? null : [empty1],
        "Empty2": empty2 == null ? null : empty2,
        "Empty3": empty3 == null ? null : empty3,
        "Datecreation": datecreation == null ? null : datecreation,
        "Idusrcreation": idusrcreation == null ? null : idusrcreation,
      };
}
