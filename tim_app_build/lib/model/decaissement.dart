// // To parse this JSON data, do
// //
// //     final decaissement = decaissementFromJson(jsonString);

// import 'dart:convert';

// List<Decaissement> decaissementFromJson(String str) => List<Decaissement>.from(
//     json.decode(str).map((x) => Decaissement.fromJson(x)));

// String decaissementToJson(List<Decaissement> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Decaissement {
//   Decaissement({
//     required this.idDecaissement,
//     required this.idMtf,
//     required this.idBnf,
//     required this.numeroDecaissement,
//     required this.numeroPiece,
//     required this.montant,
//     required this.beneficiaire,
//     required this.numeroBeneficiaire,
//     required this.commentaire,
//     required this.dateRealisation,
//     required this.photos,
//     required this.datecreation,
//     required this.idusrcreation,
//     required this.idusrcreationStatut,
//     required this.commentaireStatut,
//     required this.datecreationStatut,
//   });

//   final String idDecaissement;
//   final String idMtf;
//   final String? idBnf;
//   final String? numeroDecaissement;
//   final String? numeroPiece;
//   final String? montant;
//   final String? beneficiaire;
//   final String? numeroBeneficiaire;
//   final String? commentaire;
//   final String? dateRealisation;
//   final List<Photo>? photos;
//   final String? datecreation;
//   final String? idusrcreation;
//   final String? idusrcreationStatut;
//   final String? commentaireStatut;
//   final String? datecreationStatut;

//   factory Decaissement.fromJson(Map<String, dynamic> json) => Decaissement(
//         idDecaissement:
//             json["IdDecaissement"] == "" ? "" : json["IdDecaissement"],
//         idMtf: json["IdMtf"] == "" ? "" : json["IdMtf"],
//         idBnf: json["IdBnf"] == "" ? "" : json["IdBnf"],
//         numeroDecaissement: json["NumeroDecaissement"] == ""
//             ? ""
//             : json["NumeroDecaissement"],
//         numeroPiece: json["NumeroPiece"] == "" ? "" : json["NumeroPiece"],
//         montant: json["Montant"] == "" ? "" : json["Montant"],
//         beneficiaire:
//             json["Beneficiaire"] == "" ? "" : json["Beneficiaire"],
//         numeroBeneficiaire: json["NumeroBeneficiaire"] == ""
//             ? ""
//             : json["NumeroBeneficiaire"],
//         commentaire: json["Commentaire"] == "" ? "" : json["Commentaire"],
//         dateRealisation:
//             json["DateRealisation"] == "" ? "" : json["DateRealisation"],
//         photos: json["Photos"] == ""
//             ? null
//             : List<Photo>.from(json["Photos"].map((x) => Photo.fromJson(x))),
//         datecreation:
//             json["Datecreation"] == null ? null : json["Datecreation"],
//         idusrcreation:
//             json["Idusrcreation"] == null ? null : json["Idusrcreation"],
//         idusrcreationStatut: json["IdusrcreationStatut"] == null
//             ? null
//             : json["IdusrcreationStatut"],
//         commentaireStatut: json["CommentaireStatut"] == null
//             ? null
//             : json["CommentaireStatut"],
//         datecreationStatut: json["DatecreationStatut"] == null
//             ? null
//             : json["DatecreationStatut"],
//       );

//   Map<String, dynamic> toJson() => {
//         "IdDecaissement": idDecaissement == null ? null : idDecaissement,
//         "IdMtf": idMtf == null ? null : idMtf,
//         "IdBnf": idBnf == null ? null : idBnf,
//         "NumeroDecaissement":
//             numeroDecaissement == null ? null : numeroDecaissement,
//         "NumeroPiece": numeroPiece == null ? null : numeroPiece,
//         "Montant": montant == null ? null : montant,
//         "Beneficiaire": beneficiaire == null ? null : [beneficiaire],
//         "NumeroBeneficiaire":
//             numeroBeneficiaire == null ? null : numeroBeneficiaire,
//         "Commentaire": commentaire == null ? null : commentaire,
//         "DateRealisation": dateRealisation == null ? null : dateRealisation,
//         "Photos": photos == null
//             ? null
//             : List<dynamic>.from(photos!.map((x) => x.toJson())),
//         "Datecreation": datecreation == null ? null : datecreation,
//         "Idusrcreation": idusrcreation == null ? null : idusrcreation,
//         "IdusrcreationStatut":
//             idusrcreationStatut == null ? null : idusrcreationStatut,
//         "CommentaireStatut":
//             commentaireStatut == null ? null : commentaireStatut,
//         "DatecreationStatut":
//             datecreationStatut == null ? null : datecreationStatut
//       };
// }

// class Photo {
//   Photo({
//     required this.idPhoto,
//     required this.idDecaissement,
//     required this.libelle,
//     required this.empty1,
//     required this.empty2,
//     required this.empty3,
//     required this.datecreation,
//     required this.idusrcreation,
//   });

//   String? idPhoto;
//   String? idDecaissement;
//   String? libelle;
//   String? empty1;
//   String? empty2;
//   String? empty3;
//   String? datecreation;
//   String? idusrcreation;

//   factory Photo.fromJson(Map<String, dynamic> json) => Photo(
//         idPhoto: json["IdPhoto"] == null ? null : json["IdPhoto"],
//         idDecaissement:
//             json["IdDecaissement"] == null ? null : json["IdDecaissement"],
//         libelle: json["Libelle"] == null ? null : json["Libelle"],
//         empty1: json["Empty1"] == null ? null : json["Empty1"],
//         empty2: json["Empty2"] == null ? null : json["Empty2"],
//         empty3: json["Empty3"] == null ? null : json["Empty3"],
//         datecreation:
//             json["Datecreation"] == null ? null : json["Datecreation"],
//         idusrcreation:
//             json["Idusrcreation"] == null ? null : json["Idusrcreation"],
//       );

//   Map<String, dynamic> toJson() => {
//         "IdPhoto": idPhoto == null ? null : idPhoto,
//         "IdDecaissement": idDecaissement == null ? null : idDecaissement,
//         "Libelle": libelle == null ? null : libelle,
//         "Empty1": empty1 == null ? null : empty1,
//         "Empty2": empty2 == null ? null : empty2,
//         "Empty3": empty3 == null ? null : empty3,
//         "Datecreation": datecreation == null ? null : datecreation,
//         "Idusrcreation": idusrcreation == null ? null : idusrcreation,
//       };
// }


// To parse this JSON data, do
//
//     final decaissement = decaissementFromJson(jsonString);

import 'dart:convert';

List<Decaissement> decaissementFromJson(String str) => List<Decaissement>.from(
    json.decode(str).map((x) => Decaissement.fromJson(x)));

String decaissementToJson(List<Decaissement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Decaissement {
  Decaissement({
    required this.idDecaissement,
    required this.idMtf,
    required this.idBnf,
    required this.numeroDecaissement,
    required this.numeroPiece,
    required this.montant,
    required this.beneficiaire,
    required this.numeroBeneficiaire,
    required this.commentaire,
    required this.dateRealisation,
    required this.photos,
    required this.datecreation,
    required this.idusrcreation,
    required this.idusrcreationStatut,
    required this.commentaireStatut,
    required this.datecreationStatut,
  });

  final String? idDecaissement;
  final String idMtf;
  final String? idBnf;
  final String? numeroDecaissement;
  final String? numeroPiece;
  final String? montant;
  final String? beneficiaire;
  final String? numeroBeneficiaire;
  final String? commentaire;
  final String? dateRealisation;
  final List<Photo>? photos;
  final String? datecreation;
  final String? idusrcreation;
  final String? idusrcreationStatut;
  final String? commentaireStatut;
  final String? datecreationStatut;

  factory Decaissement.fromJson(Map<String, dynamic> json) => Decaissement(
        idDecaissement:
            json["IdDecaissement"] == null ? null : json["IdDecaissement"],
        idMtf: json["IdMtf"] == null ? null : json["IdMtf"],
        idBnf: json["IdBnf"] == null ? null : json["IdBnf"],
        numeroDecaissement: json["NumeroDecaissement"] == null
            ? null
            : json["NumeroDecaissement"],
        numeroPiece: json["NumeroPiece"] == null ? null : json["NumeroPiece"],
        montant: json["Montant"] == null ? null : json["Montant"],
        beneficiaire:
            json["Beneficiaire"] == null ? null : json["Beneficiaire"],
        numeroBeneficiaire: json["NumeroBeneficiaire"] == null
            ? null
            : json["NumeroBeneficiaire"],
        commentaire: json["Commentaire"] == null ? null : json["Commentaire"],
        dateRealisation:
            json["DateRealisation"] == null ? null : json["DateRealisation"],
        photos: json["Photos"] == null
            ? null
            : List<Photo>.from(json["Photos"].map((x) => Photo.fromJson(x))),
        datecreation:
            json["Datecreation"] == null ? null : json["Datecreation"],
        idusrcreation:
            json["Idusrcreation"] == null ? null : json["Idusrcreation"],
        idusrcreationStatut: json["IdusrcreationStatut"] == null
            ? null
            : json["IdusrcreationStatut"],
        commentaireStatut: json["CommentaireStatut"] == null
            ? null
            : json["CommentaireStatut"],
        datecreationStatut: json["DatecreationStatut"] == null
            ? null
            : json["DatecreationStatut"],
      );

  Map<String, dynamic> toJson() => {
        "IdDecaissement": idDecaissement == null ? null : idDecaissement,
        "IdMtf": idMtf == null ? null : idMtf,
        "IdBnf": idBnf == null ? null : idBnf,
        "NumeroDecaissement":
            numeroDecaissement == null ? null : numeroDecaissement,
        "NumeroPiece": numeroPiece == null ? null : numeroPiece,
        "Montant": montant == null ? null : montant,
        "Beneficiaire": beneficiaire == null ? null : [beneficiaire],
        "NumeroBeneficiaire":
            numeroBeneficiaire == null ? null : numeroBeneficiaire,
        "Commentaire": commentaire == null ? null : commentaire,
        "DateRealisation": dateRealisation == null ? null : dateRealisation,
        "Photos": photos == null
            ? null
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "Datecreation": datecreation == null ? null : datecreation,
        "Idusrcreation": idusrcreation == null ? null : idusrcreation,
        "IdusrcreationStatut":
            idusrcreationStatut == null ? null : idusrcreationStatut,
        "CommentaireStatut":
            commentaireStatut == null ? null : commentaireStatut,
        "DatecreationStatut":
            datecreationStatut == null ? null : datecreationStatut
      };
}

class Photo {
  Photo({
    required this.idPhoto,
    required this.idDecaissement,
    required this.libelle,
    required this.empty1,
    required this.empty2,
    required this.empty3,
    required this.datecreation,
    required this.idusrcreation,
  });

  String? idPhoto;
  String? idDecaissement;
  String libelle;
  String? empty1;
  String? empty2;
  String? empty3;
  String? datecreation;
  String? idusrcreation;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        idPhoto: json["IdPhoto"] == null ? null : json["IdPhoto"],
        idDecaissement:
            json["IdDecaissement"] == null ? null : json["IdDecaissement"],
        libelle: json["Libelle"] == null ? null : json["Libelle"],
        empty1: json["Empty1"] == null ? null : json["Empty1"],
        empty2: json["Empty2"] == null ? null : json["Empty2"],
        empty3: json["Empty3"] == null ? null : json["Empty3"],
        datecreation:
            json["Datecreation"] == null ? null : json["Datecreation"],
        idusrcreation:
            json["Idusrcreation"] == null ? null : json["Idusrcreation"],
      );

  Map<String, dynamic> toJson() => {
        "IdPhoto": idPhoto == null ? null : idPhoto,
        "IdDecaissement": idDecaissement == null ? null : idDecaissement,
        "Libelle": libelle == null ? null : libelle,
        "Empty1": empty1 == null ? null : empty1,
        "Empty2": empty2 == null ? null : empty2,
        "Empty3": empty3 == null ? null : empty3,
        "Datecreation": datecreation == null ? null : datecreation,
        "Idusrcreation": idusrcreation == null ? null : idusrcreation,
      };
}
