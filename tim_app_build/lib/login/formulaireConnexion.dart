// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'dart:core';
// import 'package:http/http.dart' as http;
// import 'package:tim_app_build/model/user_models.dart';
// import 'package:tim_app_build/services/userServices.dart';

// // Future<UserModel> createPosts(String pseudo, String motDePasse) async {
// //   final response = await http.post(
// //       Uri.parse(VariableEnvironnement().apiBaseUrl +
// //           "UtilisateurController.php?Action=Login"),
// //       headers: <String, String>{
// //         'Content-Type': 'application/json; charset=UTF-8',
// //       },
// //       body: jsonEncode(<String, String>{
// //         'pseudo': pseudo,
// //         'mot de passe': motDePasse,
// //       }));

// //   if (response.statusCode == 200) {
// //     return UserModel.fromJson(json.decode(response.body));
// //   } else {
// //     throw Exception('Failed to login');
// //   }
// // }

// class FormValidation extends StatefulWidget with InputValidationMixin {
//   @override
//   State<FormValidation> createState() => _FormValidationState();
// }

// class _FormValidationState extends State<FormValidation> {
//   final formGlobalKey = GlobalKey<FormState>();

//   TextEditingController _controllerPseudo = TextEditingController();
//   TextEditingController _controllerMotDePasse = TextEditingController();

//   Future<UserModel>? _futurePosts;

//   bool pressed = false;

//   @override
//   Widget build(BuildContext context) {
//     bool loginfail = false;
//     return Expanded(
//         child: SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//               height: 400,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Form(
//                   key: formGlobalKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 30),
//                       Container(
//                           margin: EdgeInsets.only(left: 5),
//                           alignment: Alignment.bottomLeft,
//                           child: RichText(
//                             text: TextSpan(
//                                 text: 'Pseudo',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold),
//                                 children: [
//                                   TextSpan(
//                                       text: ' *',
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                       ))
//                                 ]),
//                           )),
//                       const SizedBox(height: 10),
//                       Card(
//                         elevation: 10,
//                         child: (_futurePosts == null)
//                             ? TextFormField(
//                                 decoration: InputDecoration(
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 controller: _controllerPseudo,
//                                 keyboardType: TextInputType.text,
//                                 validator: (value) {
//                                   if (value!.trim().isEmpty) {
//                                     return 'Ce champs ne doit pas etre vide';
//                                   }
//                                 },
//                               )
//                             : FutureBuilder<UserModel>(
//                                 future: _futurePosts,
//                                 builder: (context, snapshot) {
//                                   if (snapshot.hasData) {
//                                     return Text(snapshot.data!.pseudo);
//                                   } else if (snapshot.hasError) {
//                                     return Text("${snapshot.error}");
//                                   }

//                                   return CircularProgressIndicator();
//                                 },
//                               ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                           // height: 20,
//                           margin: EdgeInsets.only(left: 5),
//                           alignment: Alignment.bottomLeft,
//                           child: RichText(
//                             text: TextSpan(
//                                 text: 'Mot de passe',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold),
//                                 children: [
//                                   TextSpan(
//                                       text: ' *',
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                       ))
//                                 ]),
//                           )),
//                       const SizedBox(height: 15),
//                       Card(
//                           elevation: 10,
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                             ),
//                             // maxLength: 6,
//                             obscureText: true,
//                             controller: _controllerMotDePasse,

//                             validator: (value) {
//                               if (value!.trim().isEmpty) {
//                                 return 'Ce champs ne doit pas etre vide';
//                               }
//                             },
//                           )),
//                       const SizedBox(height: 50),
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             UserService().login(context, _controllerPseudo.text,
//                                 _controllerMotDePasse.text);
//                           });
//                           if (formGlobalKey.currentState!.validate()) {
//                             formGlobalKey.currentState!.save();
//                             //use the email provided here
//                           }
//                         },
//                         child: Text("Se connecter"),
//                         style: ElevatedButton.styleFrom(
//                             fixedSize: Size(300, 50),
//                             primary: Colors.blue[900],
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             textStyle: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold)),
//                       )
//                     ],
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     ));
//   }
// }

// mixin InputValidationMixin {
//   //bool isPasswordValid(String password) => password.length == 6;
//   bool isPasswordValid(String password) => password.isNotEmpty;

//   bool isPseudoValid(String pseudo) => pseudo.isNotEmpty;
// }


import 'dart:convert';



import 'package:flutter/material.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:tim_app_build/model/user_models.dart';
import 'package:tim_app_build/services/userServices.dart';

// Future<UserModel> createPosts(String pseudo, String motDePasse) async {
//   final response = await http.post(
//       Uri.parse(VariableEnvironnement().apiBaseUrl +
//           "UtilisateurController.php?Action=Login"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'pseudo': pseudo,
//         'mot de passe': motDePasse,
//       }));

//   if (response.statusCode == 200) {
//     return UserModel.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to login');
//   }
// }

class FormValidation extends StatefulWidget with InputValidationMixin {
  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final formGlobalKey = GlobalKey<FormState>();

  TextEditingController _controllerPseudo = TextEditingController();
  TextEditingController _controllerMotDePasse = TextEditingController();

  Future<UserModel>? _futurePosts;

  bool pressed = false;
  bool isAuth = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          alignment: Alignment.bottomLeft,
                          child: RichText(
                            text: TextSpan(
                                text: 'Pseudo',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ]),
                          )),
                      const SizedBox(height: 10),
                      Card(
                        elevation: 10,
                        child: (_futurePosts == null)
                            ? TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                controller: _controllerPseudo,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Ce champs ne doit pas etre vide';
                                  }
                                },
                              )
                            : FutureBuilder<UserModel>(
                                future: _futurePosts,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.pseudo);
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  return CircularProgressIndicator();
                                },
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          // height: 20,
                          margin: EdgeInsets.only(left: 5),
                          alignment: Alignment.bottomLeft,
                          child: RichText(
                            text: TextSpan(
                                text: 'Mot de passe',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ]),
                          )),
                      const SizedBox(height: 15),
                      Card(
                          elevation: 10,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            // maxLength: 6,
                            obscureText: true,
                            controller: _controllerMotDePasse,

                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Ce champs ne doit pas etre vide';
                              }
                            },
                          )),
                      // isAuth ? Text("") : Text("Loading Completed"),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            UserService().login(context, _controllerPseudo.text,
                                _controllerMotDePasse.text);
                          });
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            //use the email provided here
                          } else {
                            setState(() {
                              UserService().login(
                                  context,
                                  _controllerPseudo.text,
                                  _controllerMotDePasse.text);
                            });
                          }
                        },
                        child: Text("Se connecter"),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 50),
                            primary: Colors.blue[900],
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}

mixin InputValidationMixin {
  //bool isPasswordValid(String password) => password.length == 6;
  bool isPasswordValid(String password) => password.isNotEmpty;

  bool isPseudoValid(String pseudo) => pseudo.isNotEmpty;
}