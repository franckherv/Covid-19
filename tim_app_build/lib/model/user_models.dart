// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.idUtilisateur,
    required this.idProfil,
    required this.nom,
    required this.prenom,
    required this.pseudo,
    required this.email,
    required this.empty1,
    required this.empty2,
    required this.empty3,
    required this.datecreation,
    required this.idUtilisateurCreation,
  });

  String idUtilisateur;
  String idProfil;
  String nom;
  String prenom;
  String pseudo;
  String email;
  String empty1;
  String empty2;
  String empty3;
  String datecreation;
  String idUtilisateurCreation;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUtilisateur: json["IdUtilisateur"],
        idProfil: json["IdProfil"],
        nom: json["Nom"],
        prenom: json["Prenom"],
        pseudo: json["Pseudo"],
        email: json["Email"],
        empty1: json["Empty1"],
        empty2: json["Empty2"],
        empty3: json["Empty3"],
        datecreation: json["Datecreation"],
        idUtilisateurCreation: json["IdUtilisateurCreation"],
      );

  Map<String, dynamic> toJson() => {
        "IdUtilisateur": idUtilisateur,
        "IdProfil": idProfil,
        "Nom": nom,
        "Prenom": prenom,
        "Pseudo": pseudo,
        "Email": email,
        "Empty1": empty1,
        "Empty2": empty2,
        "Empty3": empty3,
        "Datecreation": datecreation,
        "IdUtilisateurCreation": idUtilisateurCreation,
      };
}























// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';

// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//     UserModel({
//         this.name,
//         this.request,
//         this.response,
//     });

//     String name;
//     Request request;
//     List<dynamic> response;

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         name: json["name"],
//         request: Request.fromJson(json["request"]),
//         response: List<dynamic>.from(json["response"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "request": request.toJson(),
//         "response": List<dynamic>.from(response.map((x) => x)),
//     };
// }

// class Request {
//     Request({
//         this.method,
//         this.header,
//         this.body,
//         this.url,
//         this.description,
//     });

//     String method;
//     List<dynamic> header;
//     Body body;
//     Url url;
//     String description;

//     factory Request.fromJson(Map<String, dynamic> json) => Request(
//         method: json["method"],
//         header: List<dynamic>.from(json["header"].map((x) => x)),
//         body: Body.fromJson(json["body"]),
//         url: Url.fromJson(json["url"]),
//         description: json["description"],
//     );

//     Map<String, dynamic> toJson() => {
//         "method": method,
//         "header": List<dynamic>.from(header.map((x) => x)),
//         "body": body.toJson(),
//         "url": url.toJson(),
//         "description": description,
//     };
// }

// class Body {
//     Body({
//         this.mode,
//         this.formdata,
//     });

//     String mode;
//     List<Formdatum> formdata;

//     factory Body.fromJson(Map<String, dynamic> json) => Body(
//         mode: json["mode"],
//         formdata: List<Formdatum>.from(json["formdata"].map((x) => Formdatum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "mode": mode,
//         "formdata": List<dynamic>.from(formdata.map((x) => x.toJson())),
//     };
// }

// class Formdatum {
//     Formdatum({
//         this.key,
//         this.value,
//         this.type,
//     });

//     String key;
//     String value;
//     String type;

//     factory Formdatum.fromJson(Map<String, dynamic> json) => Formdatum(
//         key: json["key"],
//         value: json["value"],
//         type: json["type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "key": key,
//         "value": value,
//         "type": type,
//     };
// }

// class Url {
//     Url({
//         this.raw,
//         this.protocol,
//         this.host,
//         this.path,
//         this.query,
//     });

//     String raw;
//     String protocol;
//     List<String> host;
//     List<String> path;
//     List<Query> query;

//     factory Url.fromJson(Map<String, dynamic> json) => Url(
//         raw: json["raw"],
//         protocol: json["protocol"],
//         host: List<String>.from(json["host"].map((x) => x)),
//         path: List<String>.from(json["path"].map((x) => x)),
//         query: List<Query>.from(json["query"].map((x) => Query.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "raw": raw,
//         "protocol": protocol,
//         "host": List<dynamic>.from(host.map((x) => x)),
//         "path": List<dynamic>.from(path.map((x) => x)),
//         "query": List<dynamic>.from(query.map((x) => x.toJson())),
//     };
// }

// class Query {
//     Query({
//         this.key,
//         this.value,
//     });

//     String key;
//     String value;

//     factory Query.fromJson(Map<String, dynamic> json) => Query(
//         key: json["key"],
//         value: json["value"],
//     );

//     Map<String, dynamic> toJson() => {
//         "key": key,
//         "value": value,
//     };
// }
