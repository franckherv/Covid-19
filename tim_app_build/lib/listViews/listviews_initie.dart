// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import 'package:tim_app_build/controllers/decaissementController.dart';
// import 'package:tim_app_build/decaissement/formulaireDecaissement.dart';
// import 'package:tim_app_build/model/decaissement.dart';
// import 'package:tim_app_build/screen/searchScreenInitie.dart';
// import 'package:tim_app_build/services/decaissement_service.dart';
// import 'package:tim_app_build/widgets/details_widget_initie.dart';

// class ListViewsInitie extends StatefulWidget {
//   static const routeName = '/listViews-initie';
//   @override
//   State<ListViewsInitie> createState() => _ListViewsInitieState('');
// }

// class _ListViewsInitieState extends State<ListViewsInitie> {
//   final decaissementController = Get.put(DecaissementController());

//   final String idDecaissement;

//   _ListViewsInitieState(this.idDecaissement);

//   @override
//   Widget build(BuildContext context) {
//     // final decaissementData =
//     //     Provider.of<Decaissements>(context, listen: false).items;
//     // final decaissements = decaissementData;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[900],
//           title: const Text(
//             'Initiés',
//             style: TextStyle(fontSize: 18),
//           ),
//           actions: [
//             Container(
//                 height: 10,
//                 child: ElevatedButton(
//                   child: Icon(
//                     Icons.add,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(
//                       context,
//                       FormulaireDecaissement.routeName,
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                       primary: Colors.blue[900],
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       textStyle:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                 )),
//             Container(
//                 height: 10,
//                 child: ElevatedButton(
//                   child: Icon(
//                     Icons.search,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SearchScreenInitie()));
//                   },
//                   style: ElevatedButton.styleFrom(
//                       primary: Colors.blue[900],
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       textStyle:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                 ))
//           ],
//         ),
//         body: Center(
//             child: FutureBuilder<List<Decaissement>>(
//                 future: fetchDecaissement(1),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (BuildContext context, index) {
//                           Decaissement decaissement = snapshot.data![index];
//                           return Slidable(
//                               key: Key('item ${snapshot.data![index]}'),
//                               endActionPane: ActionPane(
//                                   motion: const ScrollMotion(),
//                                   // dismissible: DismissiblePane(onDismissed: () {}),
//                                   children: [
//                                     SlidableAction(
//                                       onPressed: (context) => showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return AlertDialog(
//                                                 title: const Text(
//                                                     "Confirmation de suppression"),
//                                                 content: const Text(
//                                                     "Etes-vous sûre de vouloir supprimer ce décaissement?"),
//                                                 actions: <Widget>[
//                                                   Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceAround,
//                                                       children: [
//                                                         ElevatedButton(
//                                                             style: ElevatedButton.styleFrom(
//                                                                 primary: Colors
//                                                                     .red[900],
//                                                                 padding: EdgeInsets
//                                                                     .symmetric(
//                                                                         horizontal:
//                                                                             20,
//                                                                         vertical:
//                                                                             10),
//                                                                 textStyle: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold)),
//                                                             onPressed: () =>
//                                                                 Navigator.of(
//                                                                         context)
//                                                                     .pop(true),
//                                                             child: const Text(
//                                                                 "Non")),
//                                                         ElevatedButton(
//                                                             style: ElevatedButton.styleFrom(
//                                                                 primary: Colors
//                                                                     .green,
//                                                                 padding: EdgeInsets
//                                                                     .symmetric(
//                                                                         horizontal:
//                                                                             20,
//                                                                         vertical:
//                                                                             10),
//                                                                 textStyle: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold)),
//                                                             onPressed:
//                                                                 () async {
//                                                               Navigator.pop(
//                                                                   context);
//                                                               await showDialog(
//                                                                   context:
//                                                                       context,
//                                                                   builder:
//                                                                       (BuildContext
//                                                                           context) {
//                                                                     return AlertDialog(
//                                                                         title: Text(
//                                                                             'decaissement supprimé'),
//                                                                         content:
//                                                                             const Icon(
//                                                                           Icons
//                                                                               .check,
//                                                                           color:
//                                                                               Colors.green,
//                                                                         ));
//                                                                   });
//                                                               setState(() {
//                                                                 deleteDecaissement(
//                                                                     idDecaissement);
//                                                                 snapshot.data!
//                                                                     .removeAt(
//                                                                         index);
//                                                               });
//                                                             },
//                                                             child: const Text(
//                                                                 "Oui"))
//                                                       ])
//                                                 ]);
//                                           }),
//                                       backgroundColor: Color(0xFFFE4A49),
//                                       foregroundColor: Colors.white,
//                                       icon: Icons.delete,
//                                       label: 'supprimer',
//                                     ),
//                                   ]),
//                               startActionPane: ActionPane(
//                                 motion: ScrollMotion(),
//                                 children: [
//                                   SlidableAction(
//                                     onPressed: (context) => showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return AlertDialog(
//                                               title: const Text(
//                                                   "Confirmation de publication"),
//                                               content: const Text(
//                                                   "Etes-vous sûre de vouloir publier ce décaissement?"),
//                                               actions: <Widget>[
//                                                 Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceAround,
//                                                     children: [
//                                                       ElevatedButton(
//                                                           style: ElevatedButton.styleFrom(
//                                                               primary: Colors
//                                                                   .red[900],
//                                                               padding: EdgeInsets
//                                                                   .symmetric(
//                                                                       horizontal:
//                                                                           20,
//                                                                       vertical:
//                                                                           10),
//                                                               textStyle: TextStyle(
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold)),
//                                                           onPressed: () =>
//                                                               Navigator.of(
//                                                                       context)
//                                                                   .pop(true),
//                                                           child: const Text(
//                                                               "Non")),
//                                                       ElevatedButton(
//                                                           style: ElevatedButton.styleFrom(
//                                                               primary:
//                                                                   Colors.green,
//                                                               padding: EdgeInsets
//                                                                   .symmetric(
//                                                                       horizontal:
//                                                                           20,
//                                                                       vertical:
//                                                                           10),
//                                                               textStyle: TextStyle(
//                                                                   fontSize: 16,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold)),
//                                                           onPressed: () async {
//                                                             Navigator.pop(
//                                                                 context);
//                                                             await showDialog(
//                                                                 context:
//                                                                     context,
//                                                                 builder:
//                                                                     (BuildContext
//                                                                         context) {
//                                                                   return AlertDialog(
//                                                                       title: const Text(
//                                                                           "Decaissement en attente de validation"),
//                                                                       content:
//                                                                           const Icon(
//                                                                         Icons
//                                                                             .check,
//                                                                         color: Colors
//                                                                             .green,
//                                                                       ));
//                                                                 });
//                                                             setState(() {});
//                                                           },
//                                                           child:
//                                                               const Text("Oui"))
//                                                     ])
//                                               ]);
//                                         }),
//                                     backgroundColor:
//                                         Color.fromARGB(255, 65, 190, 86),
//                                     foregroundColor: Colors.white,
//                                     icon: Icons.publish,
//                                     label: 'publier',
//                                   ),
//                                 ],
//                               ),
//                               child: WelcomePageWidgetInitie(
//                                 decaissement.idDecaissement,
//                                 decaissement.idMtf,
//                                 decaissement.idBnf,
//                                 decaissement.numeroDecaissement,
//                                 decaissement.numeroPiece,
//                                 decaissement.montant,
//                                 decaissement.beneficiaire,
//                                 decaissement.numeroBeneficiaire,
//                                 decaissement.commentaire,
//                                 decaissement.dateRealisation,
//                                 decaissement.datecreation,
//                                 decaissement.idusrcreation,
//                                 decaissement.idusrcreationStatut,
//                                 decaissement.commentaireStatut,
//                                 decaissement.datecreationStatut,
//                               ));
//                         });
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }

//                   return const CircularProgressIndicator();
//                 })));
//   }
// }

// //void doNothing(BuildContext context) {}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:tim_app_build/controllers/decaissementController.dart';
import 'package:tim_app_build/decaissement/formulaireDecaissement.dart';
import 'package:tim_app_build/model/decaissement.dart';
import 'package:tim_app_build/screen/searchScreenInitie.dart';
import 'package:tim_app_build/services/decaissement_service.dart';
import 'package:tim_app_build/widgets/details_widget_initie.dart';

class ListViewsInitie extends StatefulWidget {
  static const routeName = '/listViews-initie';
  @override
  State<ListViewsInitie> createState() => _ListViewsInitieState('');
}

class _ListViewsInitieState extends State<ListViewsInitie> {
  final decaissementController = Get.put(DecaissementController());

  final String idDecaissement;

  _ListViewsInitieState(this.idDecaissement);

  @override
  Widget build(BuildContext context) {
    // final decaissementData =
    //     Provider.of<Decaissements>(context, listen: false).items;
    // final decaissements = decaissementData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Initiés',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          FutureBuilder<List<Decaissement>>(
              future: fetchDecaissement(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 10,
                      alignment: Alignment.center,
                      child: Text(
                        '${snapshot.data!.length}',
                        style: TextStyle(fontSize: 16),
                      ));
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          Container(
              height: 10,
              child: ElevatedButton(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreenInitie()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ))
        ],
      ),
      body: Center(
          child: FutureBuilder<List<Decaissement>>(
              future: fetchDecaissement(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, index) {
                        Decaissement decaissement = snapshot.data![index];
                        print(snapshot.data!.length);
                        return Slidable(
                            key: Key('item ${snapshot.data![index]}'),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                // dismissible: DismissiblePane(onDismissed: () {}),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              title: const Text(
                                                  "Confirmation de suppression"),
                                              content: const Text(
                                                  " supprimer ce décaissement?"),
                                              actions: <Widget>[
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              primary:
                                                                  Colors.grey,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          10),
                                                              textStyle: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(true),
                                                          child: const Text(
                                                              "Non")),
                                                      ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              primary:
                                                                  Colors.green,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          10),
                                                              textStyle: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                context);
                                                            await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: AlertDialog(
                                                                          title: const Text("Decaissement supprimé"),
                                                                          content: const Icon(
                                                                            Icons.check,
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                          actions: [
                                                                            ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(primary: Colors.grey, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                                onPressed: () => Navigator.of(context).pop(true),
                                                                                child: const Text("OK")),
                                                                          ]));
                                                                });
                                                            setState(() {
                                                              deleteDecaissement(
                                                                  decaissement
                                                                      .idDecaissement
                                                                      .toString());
                                                            });
                                                          },
                                                          child:
                                                              const Text("Oui"))
                                                    ])
                                              ]);
                                        }),
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'supprimer',
                                  ),
                                ]),
                            startActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            title: const Text(
                                                "Confirmation de publication"),
                                            content: const Text(
                                                " publier ce décaissement?"),
                                            actions: <Widget>[
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            primary: Colors
                                                                .grey,
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                            textStyle: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(true),
                                                        child:
                                                            const Text("Non")),
                                                    ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            primary:
                                                                Colors.green,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                            textStyle: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        onPressed: () async {
                                                          Navigator.pop(
                                                              context);
                                                          await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                    title: const Text(
                                                                        "Decaissement en attente de validation"),
                                                                    content:
                                                                        const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Colors
                                                                          .green,
                                                                    ),
                                                                    actions: [
                                                                      ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(
                                                                              primary: Colors.grey,
                                                                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                          onPressed: () => Navigator.of(context).pop(true),
                                                                          child: const Text("OK")),
                                                                    ]);
                                                              });
                                                          setState(() {
                                                            publierDecaissement(
                                                                decaissement);
                                                          });
                                                        },
                                                        child:
                                                            const Text("Oui"))
                                                  ])
                                            ]);
                                      }),
                                  backgroundColor:
                                      Color.fromARGB(255, 65, 190, 86),
                                  foregroundColor: Colors.white,
                                  icon: Icons.publish,
                                  label: 'publier',
                                ),
                              ],
                            ),
                            child: WelcomePageWidgetInitie(
                              decaissement.idDecaissement,
                              decaissement.idMtf,
                              decaissement.idBnf,
                              decaissement.numeroDecaissement,
                              decaissement.numeroPiece,
                              decaissement.montant.toString(),
                              decaissement.beneficiaire,
                              decaissement.numeroBeneficiaire,
                              decaissement.commentaire,
                              decaissement.dateRealisation,
                              decaissement.datecreation,
                              decaissement.idusrcreation,
                              decaissement.idusrcreationStatut,
                              decaissement.commentaireStatut,
                              decaissement.datecreationStatut,
                            ));
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.pushNamed(
            context,
            FormulaireDecaissement.routeName,
          );
        },
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

//void doNothing(BuildContext context) {}


