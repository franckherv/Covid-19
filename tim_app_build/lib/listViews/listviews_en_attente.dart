
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// import 'package:provider/provider.dart';
// import 'package:tim_app_build/model/decaissement.dart';
// import 'package:tim_app_build/pages/motifRefus.dart';
// import 'package:tim_app_build/provider/decaissement_providers.dart';
// import 'package:tim_app_build/screen/searchScreenEnAttente.dart';
// import 'package:tim_app_build/services/decaissement_service.dart';
// import 'package:tim_app_build/widgets/details_widget_enAttente.dart.dart';

// class ListViewsEnAttente extends StatefulWidget {
//   static const routeName = '/listViews-attente';

//   @override
//   State<ListViewsEnAttente> createState() => _ListViewsEnAttenteState();
// }

// class _ListViewsEnAttenteState extends State<ListViewsEnAttente> {
//   @override
//   Widget build(BuildContext context) {
//     final decaissementData =
//         Provider.of<Decaissements>(context, listen: false).decaissements;
//     final decaissements = decaissementData;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[900],
//           title: Text(
//             'En attentes',
//             style: TextStyle(fontSize: 18),
//           ),
//           actions: [
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
//                             builder: (context) => SearchScreenEnAttente()));
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
//                 future: fetchDecaissement(2),
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
//                                                     "Confirmation de refus"),
//                                                 content: const Text(
//                                                     "Etes-vous sûre de vouloir refuser ce décaissement?"),
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
//                                                             onPressed: () {
//                                                               Navigator.push(
//                                                                 context,
//                                                                 MaterialPageRoute(
//                                                                     builder:
//                                                                         (context) =>
//                                                                             MotifRefus()),
//                                                               );
//                                                             },
//                                                             child: const Text(
//                                                                 "Oui"))
//                                                       ])
//                                                 ]);
//                                           }),
//                                       backgroundColor: Color(0xFFFE4A49),
//                                       foregroundColor: Colors.white,
//                                       label: 'Refuser',
//                                     ),
//                                   ]),
//                               startActionPane:
//                                   ActionPane(motion: ScrollMotion(), children: [
//                                 SlidableAction(
//                                   onPressed: (context) => showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return AlertDialog(
//                                             title: const Text(
//                                                 "Confirmation de validation"),
//                                             content: const Text(
//                                                 "Etes-vous sûre de vouloir valider ce décaissement?"),
//                                             actions: <Widget>[
//                                               Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceAround,
//                                                   children: [
//                                                     ElevatedButton(
//                                                         style: ElevatedButton.styleFrom(
//                                                             primary: Colors
//                                                                 .red[900],
//                                                             padding:
//                                                                 EdgeInsets.symmetric(
//                                                                     horizontal:
//                                                                         20,
//                                                                     vertical:
//                                                                         10),
//                                                             textStyle: TextStyle(
//                                                                 fontSize: 16,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold)),
//                                                         onPressed: () =>
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop(true),
//                                                         child:
//                                                             const Text("Non")),
//                                                     ElevatedButton(
//                                                         style: ElevatedButton.styleFrom(
//                                                             primary:
//                                                                 Colors.green,
//                                                             padding: EdgeInsets
//                                                                 .symmetric(
//                                                                     horizontal:
//                                                                         20,
//                                                                     vertical:
//                                                                         10),
//                                                             textStyle: TextStyle(
//                                                                 fontSize: 16,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold)),
//                                                         onPressed: () async {
//                                                           Navigator.pop(
//                                                               context);
//                                                           await showDialog(
//                                                               context: context,
//                                                               builder:
//                                                                   (BuildContext
//                                                                       context) {
//                                                                 return AlertDialog(
//                                                                     title: const Text(
//                                                                         "Decaissement validé"),
//                                                                     content:
//                                                                         const Icon(
//                                                                       Icons
//                                                                           .check,
//                                                                       color: Colors
//                                                                           .green,
//                                                                     ));
//                                                               });
//                                                           setState(() {});
//                                                         },
//                                                         child:
//                                                             const Text("Oui"))
//                                                   ])
//                                             ]);
//                                       }),
//                                   backgroundColor:
//                                       Color.fromARGB(255, 65, 190, 86),
//                                   foregroundColor: Colors.white,
//                                   label: 'valider',
//                                 ),
//                               ]),
//                               child: WelcomePageWidgetAttente(
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
                
              


                         
                            
                            
                          
                      
                      
                     

//               // return Dismissible(
//               //   key: Key('item ${decaissementData[index]}'),
//               //   background: Container(
//               //     color: Colors.green,
//               //     child: Padding(
//               //       padding: const EdgeInsets.all(15),
//               //       child: Row(
//               //         children: <Widget>[
//               //           Icon(Icons.publish_rounded, color: Colors.white),
//               //           Text('Valider', style: TextStyle(color: Colors.white)),
//               //         ],
//               //       ),
//               //     ),
//               //   ),
//               //   secondaryBackground: Container(
//               //     color: Colors.red,
//               //     child: Padding(
//               //       padding: const EdgeInsets.all(15),
//               //       child: Row(
//               //         mainAxisAlignment: MainAxisAlignment.end,
//               //         children: <Widget>[
//               //           Icon(Icons.delete, color: Colors.white),
//               //           Text('Refuser',
//               //               style:
//               //                   TextStyle(color: Colors.white, fontSize: 10)),
//               //         ],
//               //       ),
//               //     ),
//               //   ),
//               //   confirmDismiss: (DismissDirection direction) async {
//               //     return await showDialog(
//               //       context: context,
//               //       builder: (BuildContext context) {
//               //         return AlertDialog(
//               //           title: const Text("Confirmation de refus"),
//               //           content: const Text(
//               //               "Etes-vous sur de vouloir refuser ce décaissement?"),
//               //           actions: <Widget>[
//               //             Row(
//               //               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //               children: [
//               //                 ElevatedButton(
//               //                     style: ElevatedButton.styleFrom(
//               //                         primary: Colors.red[900],
//               //                         padding: EdgeInsets.symmetric(
//               //                             horizontal: 20, vertical: 10),
//               //                         textStyle: TextStyle(
//               //                             fontSize: 16,
//               //                             fontWeight: FontWeight.bold)),
//               //                     onPressed: () =>
//               //                         Navigator.of(context).pop(true),
//               //                     child: const Text("Non")),
//               //                 ElevatedButton(
//               //                   style: ElevatedButton.styleFrom(
//               //                       primary: Colors.green,
//               //                       padding: EdgeInsets.symmetric(
//               //                           horizontal: 20, vertical: 10),
//               //                       textStyle: TextStyle(
//               //                           fontSize: 16,
//               //                           fontWeight: FontWeight.bold)),
//               //                   onPressed: () {
//               //                     Navigator.of(context).pop(true);
//               //                   },
//               //                   child: const Text("Oui"),
//               //                 ),
//               //               ],
//               //             )
//               //           ],
//               //         );
//               //       },
//               //     );
//               //   },
//               //   onDismissed: (DismissDirection direction) {
//               //     if (direction == DismissDirection.startToEnd) {
//               //       print("Valider");
//               //     } else {
//               //       print('Refuser décaissement');
//               //     }

//               //     setState(() {
//               //       decaissementData.removeAt(index);
//               //     });
//               //   },
//               //   child: WelcomePageWidget(
//               //     decaissements[index].beneficiaire,
//               //     decaissements[index].montant,
//               //     decaissements[index].montantEnLettre,
//               //     decaissements[index].id,
//               //     decaissements[index].motif,
//               //     decaissements[index].decaissementNum,
//               //     decaissements[index].motifRefus,
//               //   ),
//               // );
            
            
                      
              
                     
  
 


        

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tim_app_build/model/decaissement.dart';
import 'package:tim_app_build/screen/searchScreenEnAttente.dart';
import 'package:tim_app_build/services/decaissement_service.dart';
import 'package:tim_app_build/widgets/details_widget_enAttente.dart.dart';

class ListViewsEnAttente extends StatefulWidget {
  static const routeName = '/listViews-attente';

  @override
  State<ListViewsEnAttente> createState() => _ListViewsEnAttenteState();
}

class _ListViewsEnAttenteState extends State<ListViewsEnAttente> {
  var _selectedCommentaireStatus;
  // var _selectedIdTypeStatut;
  // var _selectedIdTypeStatut;
  // var _selectedIdTypeStatut;
  // var _selectedIdTypeStatut;
  // var _selectedIdTypeStatut;
  // var _selectedIdTypeStatut;
  // var _selectedIdTypeStatut;
  @override
  Widget build(BuildContext context) {
    // final decaissementData =
    //     Provider.of<Decaissements>(context, listen: false).decaissements;
    // final decaissements = decaissementData;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            'En attentes',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            FutureBuilder<List<Decaissement>>(
                future: fetchDecaissement(2),
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
                            builder: (context) => SearchScreenEnAttente()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ))
          ],
        ),
        body: Center(
            child: FutureBuilder<List<Decaissement>>(
                future: fetchDecaissement(2),
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
                                          builder: (context) => AlertDialog(
                                                title: Text('Motif du Refus'),
                                                content: TextField(
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'entrez le motif de votre refus',
                                                    ),
                                                    onChanged: (Value) {
                                                      setState(() {
                                                        _selectedCommentaireStatus =
                                                            Value;
                                                      });
                                                    }),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(true);
                                                      },
                                                      child: Text('ANNULER')),
                                                  TextButton(
                                                      onPressed: () async {
                                                        var execute =
                                                            await motifRefusDecaissement(
                                                          // _selectedidDecaissement,
                                                          _selectedCommentaireStatus,
                                                          // _selectedCommentaireStatus,
                                                          // _selectedCommentaireStatus,
                                                          // _selectedCommentaireStatus,
                                                          // _selectedCommentaireStatus,
                                                          // _selectedCommentaireStatus,
                                                          // _selectedCommentaireStatus,
                                                          // _selectedCommentaireStatus,
                                                        );
                                                        print(execute);
                                                        if (execute == true) {
                                                          AlertDialog(
                                                              title: const Text(
                                                                  "Confirmation de refus"),
                                                              content: const Text(
                                                                  " refuser ce décaissement?"),
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
                                                                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.of(context).pop(true),
                                                                        child: const Text(
                                                                            "Non"),
                                                                      ),
                                                                      ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(
                                                                              primary: Colors.green,
                                                                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                          onPressed: () {
                                                                            // Navigator.push(
                                                                            //   context,
                                                                            //   MaterialPageRoute(
                                                                            //       builder:
                                                                            //           (context) =>
                                                                            //               MotifRefus()),
                                                                            // );

                                                                            setState(() {
                                                                              refuserDecaissement(decaissement);
                                                                            });
                                                                          },
                                                                          child: const Text("Oui"))
                                                                    ])
                                                              ]);
                                                        } else {
                                                          print(
                                                              'initialisation échouée');
                                                        }
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(builder: (context) => ListViewsInitie()),
                                                        // );
                                                      },
                                                      child: Text('SOUMETTRE'))
                                                ],
                                              )),
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      label: 'Refuser',
                                    ),
                                  ]),
                              startActionPane:
                                  ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                  onPressed: (context) => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            title: const Text(
                                                "Confirmation de validation"),
                                            content: const Text(
                                                " valider ce décaissement?"),
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
                                                                        "Decaissement validé"),
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
                                                            validerDecaissement(
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
                                  label: 'valider',
                                ),
                              ]),
                              child: WelcomePageWidgetAttente(
                                decaissement.idDecaissement,
                                decaissement.idMtf,
                                decaissement.idBnf,
                                decaissement.numeroDecaissement,
                                decaissement.numeroPiece,
                                decaissement.montant,
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
                })));
  }
}
                
              


                         
                            
                            
                          
                      
                      
                     

              // return Dismissible(
              //   key: Key('item ${decaissementData[index]}'),
              //   background: Container(
              //     color: Colors.green,
              //     child: Padding(
              //       padding: const EdgeInsets.all(15),
              //       child: Row(
              //         children: <Widget>[
              //           Icon(Icons.publish_rounded, color: Colors.white),
              //           Text('Valider', style: TextStyle(color: Colors.white)),
              //         ],
              //       ),
              //     ),
              //   ),
              //   secondaryBackground: Container(
              //     color: Colors.red,
              //     child: Padding(
              //       padding: const EdgeInsets.all(15),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: <Widget>[
              //           Icon(Icons.delete, color: Colors.white),
              //           Text('Refuser',
              //               style:
              //                   TextStyle(color: Colors.white, fontSize: 10)),
              //         ],
              //       ),
              //     ),
              //   ),
              //   confirmDismiss: (DismissDirection direction) async {
              //     return await showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: const Text("Confirmation de refus"),
              //           content: const Text(
              //               "Etes-vous sur de vouloir refuser ce décaissement?"),
              //           actions: <Widget>[
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                         primary: Colors.red[900],
              //                         padding: EdgeInsets.symmetric(
              //                             horizontal: 20, vertical: 10),
              //                         textStyle: TextStyle(
              //                             fontSize: 16,
              //                             fontWeight: FontWeight.bold)),
              //                     onPressed: () =>
              //                         Navigator.of(context).pop(true),
              //                     child: const Text("Non")),
              //                 ElevatedButton(
              //                   style: ElevatedButton.styleFrom(
              //                       primary: Colors.green,
              //                       padding: EdgeInsets.symmetric(
              //                           horizontal: 20, vertical: 10),
              //                       textStyle: TextStyle(
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.bold)),
              //                   onPressed: () {
              //                     Navigator.of(context).pop(true);
              //                   },
              //                   child: const Text("Oui"),
              //                 ),
              //               ],
              //             )
              //           ],
              //         );
              //       },
              //     );
              //   },
              //   onDismissed: (DismissDirection direction) {
              //     if (direction == DismissDirection.startToEnd) {
              //       print("Valider");
              //     } else {
              //       print('Refuser décaissement');
              //     }

              //     setState(() {
              //       decaissementData.removeAt(index);
              //     });
              //   },
              //   child: WelcomePageWidget(
              //     decaissements[index].beneficiaire,
              //     decaissements[index].montant,
              //     decaissements[index].montantEnLettre,
              //     decaissements[index].id,
              //     decaissements[index].motif,
              //     decaissements[index].decaissementNum,
              //     decaissements[index].motifRefus,
              //   ),
              // );
            
            
                      
              
                     
  
 


        




        //  showDialog(
        //                                                           context:
        //                                                               context,
        //                                                           builder:
        //                                                               (context) =>
        //                                                                   AlertDialog(
        //                                                                     title:
        //                                                                         Text('Motif'),
        //                                                                     content: TextField(
        //                                                                         decoration: InputDecoration(
        //                                                                           hintText: 'entrez le motif de votre refus',
        //                                                                         ),
        //                                                                         onChanged: Value(_selectedCommentaire)),
        //                                                                     actions: [
        //                                                                       TextButton(
        //                                                                           onPressed: () async {
        //                                                                             var execute = await refuserDecaissement(_selectedCommentaire);
        //                                                                             print(execute);
        //                                                                             if (execute == true) {
        //                                                                               Navigator.push(
        //                                                                                 context,
        //                                                                                 MaterialPageRoute(builder: (context) => ListViewsEnAttente()),
        //                                                                               );
        //                                                                             } else {
        //                                                                               print('initialisation échouée');
        //                                                                             }
        //                                                                             // Navigator.push(
        //                                                                             //   context,
        //                                                                             //   MaterialPageRoute(builder: (context) => ListViewsInitie()),
        //                                                                             // );
        //                                                                           },
        //                                                                           child: Text('SOUMETTRE'))
        //                                                                     ],
        //                                                                   ));







        // AlertDialog(
        //                                         title: const Text(
        //                                             "Confirmation de refus"),
        //                                         content: const Text(
        //                                             " refuser ce décaissement?"),
        //                                         actions: <Widget>[
        //                                           Row(
        //                                               mainAxisAlignment:
        //                                                   MainAxisAlignment
        //                                                       .spaceAround,
        //                                               children: [
        //                                                 ElevatedButton(
        //                                                   style: ElevatedButton.styleFrom(
        //                                                       primary:
        //                                                           Colors.grey,
        //                                                       padding: EdgeInsets
        //                                                           .symmetric(
        //                                                               horizontal:
        //                                                                   20,
        //                                                               vertical:
        //                                                                   10),
        //                                                       textStyle: TextStyle(
        //                                                           fontSize: 16,
        //                                                           fontWeight:
        //                                                               FontWeight
        //                                                                   .bold)),
        //                                                   onPressed: () =>
        //                                                       Navigator.of(
        //                                                               context)
        //                                                           .pop(true),
        //                                                   child:
        //                                                       const Text("Non"),
        //                                                 ),
        //                                                 ElevatedButton(
        //                                                     style: ElevatedButton.styleFrom(
        //                                                         primary: Colors
        //                                                             .green,
        //                                                         padding: EdgeInsets
        //                                                             .symmetric(
        //                                                                 horizontal:
        //                                                                     20,
        //                                                                 vertical:
        //                                                                     10),
        //                                                         textStyle: TextStyle(
        //                                                             fontSize:
        //                                                                 16,
        //                                                             fontWeight:
        //                                                                 FontWeight
        //                                                                     .bold)),
        //                                                     onPressed: () {
        //                                                       // Navigator.push(
        //                                                       //   context,
        //                                                       //   MaterialPageRoute(
        //                                                       //       builder:
        //                                                       //           (context) =>
        //                                                       //               MotifRefus()),
        //                                                       // );

        //                                                       setState(() {
        //                                                         refuserDecaissement(
        //                                                             decaissement);
        //                                                       });
        //                                                     },
        //                                                     child: const Text(
        //                                                         "Oui")
        //                                                         )
        //                                               ])
        //                                         ]);