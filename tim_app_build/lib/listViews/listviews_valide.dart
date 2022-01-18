
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tim_app_build/model/decaissement.dart';
// import 'package:tim_app_build/provider/decaissement_providers.dart';
// import 'package:tim_app_build/screen/seachScreenValide.dart';
// import 'package:tim_app_build/services/decaissement_service.dart';
// import 'package:tim_app_build/widgets/details_widget_valide.dart';

// class ListViewsValide extends StatefulWidget {
//   static const routeName = '/listViews-valide';
//   @override
//   State<ListViewsValide> createState() => _ListViewsValideState();
// }

// class _ListViewsValideState extends State<ListViewsValide> {
//   @override
//   Widget build(BuildContext context) {
//     final decaissementData = Provider.of<Decaissements>(context, listen: false)
//         .decaissementController;
//     final decaissements = decaissementData;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[900],
//           title: Text(
//             'Validés',
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
//                             builder: (context) => SearchScreenValide()));
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
//                 future: fetchDecaissement(3),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (BuildContext context, index) {
//                           Decaissement decaissement = snapshot.data![index];
//                           return WelcomePageWidgetValide(
//                               decaissement.idDecaissement,
//                               decaissement.idMtf,
//                               decaissement.idBnf,
//                               decaissement.numeroDecaissement,
//                               decaissement.numeroPiece,
//                               decaissement.montant,
//                               decaissement.beneficiaire,
//                               decaissement.numeroBeneficiaire,
//                               decaissement.commentaire,
//                               decaissement.dateRealisation,
//                               decaissement.datecreation,
//                               decaissement.idusrcreation,
//                               decaissement.idusrcreationStatut,
//                               decaissement.commentaireStatut,
//                               decaissement.datecreationStatut);
//                         });
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }

//                   return const CircularProgressIndicator();
//                 })));
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_app_build/model/decaissement.dart';
import 'package:tim_app_build/provider/decaissement_providers.dart';
import 'package:tim_app_build/screen/seachScreenValide.dart';
import 'package:tim_app_build/services/decaissement_service.dart';
import 'package:tim_app_build/widgets/details_widget_valide.dart';

class ListViewsValide extends StatefulWidget {
  static const routeName = '/listViews-valide';
  @override
  State<ListViewsValide> createState() => _ListViewsValideState();
}

class _ListViewsValideState extends State<ListViewsValide> {
  @override
  Widget build(BuildContext context) {
    final decaissementData = Provider.of<Decaissements>(context, listen: false)
        .decaissementController;
    final decaissements = decaissementData;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            'Validés',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            FutureBuilder<List<Decaissement>>(
                future: fetchDecaissement(3),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        margin: EdgeInsets.only(right: 20),
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
                            builder: (context) => SearchScreenValide()));
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
                future: fetchDecaissement(3),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) {
                          Decaissement decaissement = snapshot.data![index];
                          return WelcomePageWidgetValide(
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
                              decaissement.datecreationStatut);
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                })));
  }
}
