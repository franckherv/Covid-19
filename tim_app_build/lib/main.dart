// import 'package:flutter/material.dart';
// import'package:provider/provider.dart';
// import 'package:tim_app_build/decaissement/formulaireDecaissement.dart';
// import 'package:tim_app_build/listViews/listviews_initie.dart';
// import 'package:tim_app_build/pages/motifRefus.dart';
// import 'package:tim_app_build/pages/splashScreen.dart';
// import 'package:tim_app_build/provider/decaissement_providers.dart';
// import 'package:tim_app_build/screen/details_decaissement_enAttente.dart';
// import 'package:tim_app_build/screen/details_decaissement_initie.dart';
// import 'package:tim_app_build/screen/details_decaissement_refuse.dart';
// import 'package:tim_app_build/screen/details_decaissement_valide.dart';
// import 'package:tim_app_build/screen/image_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => Decaissements(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'BILL SOFT',
//         home: SplashPage(),
//         routes: {
//           DetailsDecaissementEnAttente.routeName: (ctx) =>DetailsDecaissementEnAttente(),
//           DetailsDecaissementInitie.routeName: (ctx) => DetailsDecaissementInitie(),
//           DetailsDecaissementValide.routeName: (ctx) =>DetailsDecaissementValide(),
//           DetailsDecaissementRefuse.routeName: (ctx) =>
//               DetailsDecaissementRefuse(),
//           //SearchScreen.routeName: (ctx) => SearchScreen(),
//           ImageScreen.routeName: (ctx) => ImageScreen(),
//           ListViewsInitie.routeName: (ctx) => ListViewsInitie(),
//           FormulaireDecaissement.routeName: (ctx) =>
//               const FormulaireDecaissement(),
//           MotifRefus.routeName: (ctx) => const MotifRefus(),
//           // ListSearch.routeName: (ctx) => ListSearch(),
//           //ListViews.routeName: (ctx)=>ListViews(),
//         },
//       ),
//     );
//   }
// }




// //   @override
// //   Widget build(BuildContext context) {
// //     final decaissementData =
// //         Provider.of<Decaissements>(context, listen: false).items;
// //     final decaissements = decaissementData;
// //     return Scaffold(
// //         body: Column(children: <Widget>[
// //       Container(
// //         padding: const EdgeInsets.all(20.0),
// //         child: TextField(
// //           controller: _textController,
// //           decoration: InputDecoration(
// //             hintText: 'Recherche...',
// //           ),
// //           onChanged: onItemChanged,
// //         ),
// //       ),
// //       Expanded(
// //         child: ListView.builder(
// //             itemCount: decaissements.length,
// //             itemBuilder: (context, index) {
// //               return Dismissible(
// //                 key: Key('item ${decaissementData[index]}'),
// //                 background: Container(
// //                   color: Colors.green,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(15),
// //                     child: Row(
// //                       children: <Widget>[
// //                         Icon(Icons.publish_rounded, color: Colors.white),
// //                         Text('publier', style: TextStyle(color: Colors.white)),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 secondaryBackground: Container(
// //                   color: Colors.red,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(15),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.end,
// //                       children: <Widget>[
// //                         Icon(Icons.delete, color: Colors.white),
// //                         Text('Mettre dans la corbeille',
// //                             style:
// //                                 TextStyle(color: Colors.white, fontSize: 10)),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 confirmDismiss: (DismissDirection direction) async {
// //                   return await showDialog(
// //                     context: context,
// //                     builder: (BuildContext context) {
// //                       return AlertDialog(
// //                         title: const Text("Confirmation de suppression"),
// //                         content: const Text(
// //                             "Etes-vous sur de vouloir supprimer ce décaissement?"),
// //                         actions: <Widget>[
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                             children: [
// //                               ElevatedButton(
// //                                   style: ElevatedButton.styleFrom(
// //                                       primary: Colors.red[900],
// //                                       padding: EdgeInsets.symmetric(
// //                                           horizontal: 20, vertical: 10),
// //                                       textStyle: TextStyle(
// //                                           fontSize: 16,
// //                                           fontWeight: FontWeight.bold)),
// //                                   onPressed: () =>
// //                                       Navigator.of(context).pop(true),
// //                                   child: const Text("Non")),
// //                               ElevatedButton(
// //                                 style: ElevatedButton.styleFrom(
// //                                     primary: Colors.green,
// //                                     padding: EdgeInsets.symmetric(
// //                                         horizontal: 20, vertical: 10),
// //                                     textStyle: TextStyle(
// //                                         fontSize: 16,
// //                                         fontWeight: FontWeight.bold)),
// //                                 onPressed: () {
// //                                   Navigator.of(context).pop(true);
// //                                 },
// //                                 child: const Text("Oui"),
// //                               ),
// //                             ],
// //                           )
// //                         ],
// //                       );
// //                     },
// //                   );
// //                 },
// //                 onDismissed: (DismissDirection direction) {
// //                   if (direction == DismissDirection.startToEnd) {
// //                     print("publier");
// //                   } else {
// //                     print('supprimer décaissement');
// //                   }

// //                   setState(() {
// //                     decaissementData.removeAt(index);
// //                   });
// //                 },
// //                 child: WelcomePageWidget(
// //                     decaissements[index].beneficiaire,
// //                     decaissements[index].montant,
// //                     decaissements[index].montantEnLettre,
// //                     decaissements[index].id,
// //                     decaissements[index].motif,
// //                     decaissements[index].decaissementNum,
// //                     decaissements[index].motifRefus),
// //               );
// //             }),
// //       )
// //     ]));
// //   }
// // }








import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_app_build/decaissement/formulaireDecaissement.dart';
import 'package:tim_app_build/listViews/listviews_initie.dart';
import 'package:tim_app_build/pages/motifRefus.dart';
import 'package:tim_app_build/pages/splashScreen.dart';
import 'package:tim_app_build/provider/decaissement_providers.dart';
import 'package:tim_app_build/screen/details_decaissement_enAttente.dart';
import 'package:tim_app_build/screen/details_decaissement_initie.dart';
import 'package:tim_app_build/screen/details_decaissement_refuse.dart';
import 'package:tim_app_build/screen/details_decaissement_valide.dart';
import 'package:tim_app_build/screen/image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Decaissements(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BILL SOFT',
        home: SplashPage(),
        routes: {
          DetailsDecaissementEnAttente.routeName: (ctx) =>
              DetailsDecaissementEnAttente(),
          DetailsDecaissementInitie.routeName: (ctx) =>
              DetailsDecaissementInitie(),
          DetailsDecaissementValide.routeName: (ctx) =>
              DetailsDecaissementValide(),
          DetailsDecaissementRefuse.routeName: (ctx) =>
              DetailsDecaissementRefuse(),
          //SearchScreen.routeName: (ctx) => SearchScreen(),
          ImageScreen.routeName: (ctx) => ImageScreen(),
          ListViewsInitie.routeName: (ctx) => ListViewsInitie(),
          FormulaireDecaissement.routeName: (ctx) =>
              const FormulaireDecaissement(),
          MotifRefus.routeName: (ctx) => MotifRefus(),
          // ListSearch.routeName: (ctx) => ListSearch(),
          //ListViews.routeName: (ctx)=>ListViews(),
        },
      ),
    );
  }
}




//   @override
//   Widget build(BuildContext context) {
//     final decaissementData =
//         Provider.of<Decaissements>(context, listen: false).items;
//     final decaissements = decaissementData;
//     return Scaffold(
//         body: Column(children: <Widget>[
//       Container(
//         padding: const EdgeInsets.all(20.0),
//         child: TextField(
//           controller: _textController,
//           decoration: InputDecoration(
//             hintText: 'Recherche...',
//           ),
//           onChanged: onItemChanged,
//         ),
//       ),
//       Expanded(
//         child: ListView.builder(
//             itemCount: decaissements.length,
//             itemBuilder: (context, index) {
//               return Dismissible(
//                 key: Key('item ${decaissementData[index]}'),
//                 background: Container(
//                   color: Colors.green,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Row(
//                       children: <Widget>[
//                         Icon(Icons.publish_rounded, color: Colors.white),
//                         Text('publier', style: TextStyle(color: Colors.white)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 secondaryBackground: Container(
//                   color: Colors.red,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         Icon(Icons.delete, color: Colors.white),
//                         Text('Mettre dans la corbeille',
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 10)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 confirmDismiss: (DismissDirection direction) async {
//                   return await showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text("Confirmation de suppression"),
//                         content: const Text(
//                             "Etes-vous sur de vouloir supprimer ce décaissement?"),
//                         actions: <Widget>[
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.red[900],
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20, vertical: 10),
//                                       textStyle: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold)),
//                                   onPressed: () =>
//                                       Navigator.of(context).pop(true),
//                                   child: const Text("Non")),
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     primary: Colors.green,
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 20, vertical: 10),
//                                     textStyle: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold)),
//                                 onPressed: () {
//                                   Navigator.of(context).pop(true);
//                                 },
//                                 child: const Text("Oui"),
//                               ),
//                             ],
//                           )
//                         ],
//                       );
//                     },
//                   );
//                 },
//                 onDismissed: (DismissDirection direction) {
//                   if (direction == DismissDirection.startToEnd) {
//                     print("publier");
//                   } else {
//                     print('supprimer décaissement');
//                   }

//                   setState(() {
//                     decaissementData.removeAt(index);
//                   });
//                 },
//                 child: WelcomePageWidget(
//                     decaissements[index].beneficiaire,
//                     decaissements[index].montant,
//                     decaissements[index].montantEnLettre,
//                     decaissements[index].id,
//                     decaissements[index].motif,
//                     decaissements[index].decaissementNum,
//                     decaissements[index].motifRefus),
//               );
//             }),
//       )
//     ]));
//   }
// }




