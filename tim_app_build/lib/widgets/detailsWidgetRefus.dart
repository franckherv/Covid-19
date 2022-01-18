// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tim_app_build/controllers/motifController.dart';

// import '../screen/details_decaissement_refuse.dart';

// class WelcomePageWidgetRefus extends StatefulWidget {
//   final String? idDecaissement;
//   final String idMtf;
//   final String? idBnf;
//   final String? numeroDecaissement;
//   final String? numeroPiece;
//   final String? montant;
//   final String? beneficiaire;
//   final String? numeroBeneficiaire;
//   final String? commentaire;
//   final String? dateRealisation;
//   final String? datecreation;
//   final String? idusrcreation;

//   WelcomePageWidgetRefus(
//     this.idDecaissement,
//     this.idMtf,
//     this.idBnf,
//     this.numeroDecaissement,
//     this.numeroPiece,
//     this.montant,
//     this.beneficiaire,
//     this.commentaire,
//     this.dateRealisation,
//     this.datecreation,
//     this.idusrcreation,
//     this.numeroBeneficiaire,
//   );

//   @override
//   State<WelcomePageWidgetRefus> createState() => _WelcomePageWidgetRefusState();
// }

// class _WelcomePageWidgetRefusState extends State<WelcomePageWidgetRefus> {
//   final motifController = Get.put(MotifController());

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(5),
//       scrollDirection: Axis.vertical,
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.pushNamed(context, DetailsDecaissementRefuse.routeName,
//                   arguments: widget.idDecaissement);
//             },
//             child: Card(
//               elevation: 10,
//               child: ListTile(
//                   title: Text(
//                     '${widget.beneficiaire}',
//                     maxLines: 1,
//                   ),
//                   subtitle: Text(
//                     '${motifController.getLibelleMotif(widget.idMtf)}',
//                     maxLines: 1,
//                   ),
//                   trailing: Text(
//                     '${widget.montant}F',
//                     maxLines: 1,
//                   )),
//               margin: const EdgeInsets.all(0.0),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }





//import 'package:billsoft/screen/details_decaissement_initie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_app_build/controllers/motifController.dart';

import '../screen/details_decaissement_refuse.dart';

class WelcomePageWidgetRefus extends StatefulWidget {
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
  final String? datecreation;
  final String? idusrcreation;

  WelcomePageWidgetRefus(
    this.idDecaissement,
    this.idMtf,
    this.idBnf,
    this.numeroDecaissement,
    this.numeroPiece,
    this.montant,
    this.beneficiaire,
    this.commentaire,
    this.dateRealisation,
    this.datecreation,
    this.idusrcreation,
    this.numeroBeneficiaire,
  );

  @override
  State<WelcomePageWidgetRefus> createState() => _WelcomePageWidgetRefusState();
}

class _WelcomePageWidgetRefusState extends State<WelcomePageWidgetRefus> {
  final motifController = Get.put(MotifController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailsDecaissementRefuse.routeName,
                  arguments: widget.idDecaissement);
            },
            child: Card(
              elevation: 10,
              child: ListTile(
                  title: Text(
                    '${widget.beneficiaire}',
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    '${motifController.getLibelleMotif(widget.idMtf)}',
                    maxLines: 1,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.numeroDecaissement}',
                        maxLines: 1,
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        '${widget.montant}F',
                        maxLines: 1,
                      )
                    ],
                  )),
              margin: const EdgeInsets.all(0.0),
            ),
          )
        ],
      ),
    );
  }
}