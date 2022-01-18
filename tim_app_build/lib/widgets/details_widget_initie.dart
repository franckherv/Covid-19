// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tim_app_build/controllers/motifController.dart';
// import 'package:tim_app_build/screen/details_decaissement_initie.dart';

// class WelcomePageWidgetInitie extends StatefulWidget {
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
//   final String? idusrcreationStatut;
//   final String? commentaireStatut;
//   final String? datecreationStatut;

//   WelcomePageWidgetInitie(
//       this.idDecaissement,
//       this.idMtf,
//       this.idBnf,
//       this.numeroDecaissement,
//       this.numeroPiece,
//       this.montant,
//       this.beneficiaire,
//       this.numeroBeneficiaire,
//       this.commentaire,
//       this.dateRealisation,
//       this.datecreation,
//       this.idusrcreation,
//       this.idusrcreationStatut,
//       this.commentaireStatut,
//       this.datecreationStatut);

//   @override
//   State<WelcomePageWidgetInitie> createState() =>
//       _WelcomePageWidgetInitieState();
// }

// class _WelcomePageWidgetInitieState extends State<WelcomePageWidgetInitie> {
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
//               Navigator.pushNamed(context, DetailsDecaissementInitie.routeName,
//                       arguments: widget.idDecaissement)
//                   .whenComplete(() => setState(() {}));
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



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_app_build/controllers/motifController.dart';
import 'package:tim_app_build/screen/details_decaissement_initie.dart';

class WelcomePageWidgetInitie extends StatefulWidget {
  final String? idDecaissement;
  final String idMtf;
  final String? idBnf;
  final String? numeroDecaissement;
  final String? numeroPiece;
  final String montant;
  final String? beneficiaire;
  final String? numeroBeneficiaire;
  final String? commentaire;
  final String? dateRealisation;
  final String? datecreation;
  final String? idusrcreation;
  final String? idusrcreationStatut;
  final String? commentaireStatut;
  final String? datecreationStatut;

  WelcomePageWidgetInitie(
      this.idDecaissement,
      this.idMtf,
      this.idBnf,
      this.numeroDecaissement,
      this.numeroPiece,
      this.montant,
      this.beneficiaire,
      this.numeroBeneficiaire,
      this.commentaire,
      this.dateRealisation,
      this.datecreation,
      this.idusrcreation,
      this.idusrcreationStatut,
      this.commentaireStatut,
      this.datecreationStatut);

  @override
  State<WelcomePageWidgetInitie> createState() =>
      _WelcomePageWidgetInitieState();
}

class _WelcomePageWidgetInitieState extends State<WelcomePageWidgetInitie> {
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
              Navigator.pushNamed(context, DetailsDecaissementInitie.routeName,
                      arguments: widget.idDecaissement)
                  .whenComplete(() => setState(() {}));
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
                        '${double.tryParse(widget.montant)}',
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