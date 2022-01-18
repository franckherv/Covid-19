// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:provider/provider.dart';
// import 'package:tim_app_build/model/decaissement.dart';
// import 'package:tim_app_build/provider/decaissement_providers.dart';
// import 'package:tim_app_build/screen/searchScreenRefus.dart';
// import 'package:tim_app_build/services/decaissement_service.dart';
// import 'package:tim_app_build/widgets/detailsWidgetRefus.dart';

// class ListViewsRefus extends StatefulWidget {
//   static const routeName = '/listViews-refus';

//   @override
//   State<ListViewsRefus> createState() => _ListViewsRefusState();
// }

// class _ListViewsRefusState extends State<ListViewsRefus> {
//   @override
//   Widget build(BuildContext context) {
//     final decaissementData =
//         Provider.of<Decaissements>(context, listen: false).decaissements;
//     final decaissements = decaissementData;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[900],
//           title: Text(
//             'Refusés',
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
//                             builder: (context) => SearchScreenRefus()));
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
//                 future: fetchDecaissement(4),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (BuildContext context, index) {
//                           Decaissement decaissement = snapshot.data![index];
//                           return Slidable(
//                             key: Key('item ${snapshot.data![index]}'),
//                             startActionPane: ActionPane(
//                                 motion: const ScrollMotion(),
//                                 children: [
//                                   SlidableAction(
//                                     onPressed: (context) => showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return AlertDialog(
//                                               title: const Text(
//                                                   "Confirmation de relancement"),
//                                               content: const Text(
//                                                   "Etes-vous sûre de vouloir relancer ce décaissement?"),
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
//                                     icon: Icons.update_rounded,
//                                     label: 'relancer',
//                                   ),
//                                 ]),
//                             child: WelcomePageWidgetRefus(
//                               decaissement.idDecaissement,
//                               decaissement.idMtf,
//                               decaissement.idBnf,
//                               decaissement.numeroDecaissement,
//                               decaissement.numeroPiece,
//                               decaissement.montant,
//                               decaissement.beneficiaire,
//                               decaissement.commentaire,
//                               decaissement.dateRealisation,
//                               decaissement.datecreation,
//                               decaissement.idusrcreation,
//                               decaissement.numeroBeneficiaire,
//                             ),
//                           );
//                         });
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }

//                   return const CircularProgressIndicator();
//                 })));
//   }
// }

// void doNothing(BuildContext context) {}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tim_app_build/controllers/decaissementController.dart';
import 'package:tim_app_build/model/decaissement.dart';
import 'package:tim_app_build/screen/searchScreenRefus.dart';
import 'package:tim_app_build/services/decaissement_service.dart';
import 'package:tim_app_build/widgets/detailsWidgetRefus.dart';

class ListViewsRefus extends StatefulWidget {
  static const routeName = '/listViews-refus';

  State<ListViewsRefus> createState() => _ListViewsRefusState('');
}

class _ListViewsRefusState extends State<ListViewsRefus> {
  final decaissementController = Get.put(DecaissementController());

  final String idDecaissement;

  _ListViewsRefusState(this.idDecaissement);

  @override
  Widget build(BuildContext context) {
    // final decaissementData =
    //     Provider.of<Decaissements>(context, listen: false).decaissements;
    // final decaissements = decaissementData;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            'Refusés',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            FutureBuilder<List<Decaissement>>(
                future: fetchDecaissement(4),
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
                            builder: (context) => SearchScreenRefus()));
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
                future: fetchDecaissement(4),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) {
                          Decaissement decaissement = snapshot.data![index];
                          return Slidable(
                            key: Key('item ${snapshot.data![index]}'),
                            startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              title: const Text(
                                                  "Confirmation de relancement"),
                                              content: const Text(
                                                  "relancer ce décaissement?"),
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
                                                              relancerDecaissement(
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
                                    icon: Icons.update_rounded,
                                    label: 'relancer',
                                  ),
                                ]),
                            child: WelcomePageWidgetRefus(
                              decaissement.idDecaissement,
                              decaissement.idMtf,
                              decaissement.idBnf,
                              decaissement.numeroDecaissement,
                              decaissement.numeroPiece,
                              decaissement.montant,
                              decaissement.beneficiaire,
                              decaissement.commentaire,
                              decaissement.dateRealisation,
                              decaissement.datecreation,
                              decaissement.idusrcreation,
                              decaissement.numeroBeneficiaire,
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                })));
  }
}

void doNothing(BuildContext context) {}