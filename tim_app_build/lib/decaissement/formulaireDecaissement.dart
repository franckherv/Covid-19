
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';
// import 'package:provider/provider.dart';
// import 'package:tim_app_build/controllers/beneficiaireController.dart';
// import 'package:tim_app_build/controllers/decaissementController.dart';
// import 'package:tim_app_build/controllers/motifController.dart';
// import 'package:tim_app_build/listViews/listviews_initie.dart';
// import 'package:tim_app_build/model/decaissement.dart';
// import 'package:tim_app_build/provider/decaissement_providers.dart';
// import 'package:tim_app_build/screen/thousandsSeparatorInputFormatter.dart';
// import 'package:tim_app_build/widgets/inputImage.dart';

// class FormulaireDecaissement extends StatefulWidget {
//   static const routeName = '/formulaire';
//   const FormulaireDecaissement({Key? key}) : super(key: key);

//   @override
//   _FormulaireDecaissementState createState() => _FormulaireDecaissementState();
// }

// class _FormulaireDecaissementState extends State<FormulaireDecaissement> {
//   final beneficiaireController = Get.put(BeneficiaireController());
//   final decaissementController = Get.put(DecaissementController());

//   final motifController = Get.put(MotifController());

//   // List<String> _benef = [
//   //   'CIE',
//   //   'SODECI',
//   //   'Logement',
//   // ];
//   var _selectedbeneficiaire;

//   // List<String> _motf = [
//   //   'Facture d\'eau',
//   //   'Facture d\' electricité',
//   //   'Facture du logement',
//   // ];
//   var _selectedmotif;

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   //final _titleController = TextEditingController();
//   late File _pickedImage;

//   final _beneficiaire = FocusNode();
//   final _decaissementNum = FocusNode();
//   final _montant = FocusNode();
//   final _date = FocusNode();
//   final _motif = FocusNode();
//   final _commentaire = FocusNode();

//   var _isInit = true;

//   var _editDecaissement = Decaissement(
//       idDecaissement: '',
//       idMtf: '',
//       idBnf: '',
//       numeroDecaissement: '',
//       numeroPiece: '',
//       montant: '',
//       beneficiaire: '',
//       numeroBeneficiaire: '',
//       commentaire: '',
//       dateRealisation: '',
//       photos: [],
//       datecreation: '',
//       idusrcreation: '',
//       idusrcreationStatut: '',
//       commentaireStatut: '',
//       datecreationStatut: ''

//       //File(),
//       );
//   var _initialValues = {
//     'beneficiaire': '',
//     'decaissementNum': '',
//     'montant': '',
//     'date': '',
//     'motif': '',
//     'commentaire': '',
//   };

//   @override
//   void dispose() {
//     _motif.dispose();

//     _beneficiaire.dispose();
//     _montant.dispose();
//     _date.dispose();
//     _commentaire.dispose();
//     _decaissementNum.dispose();

//     super.dispose();
//   }

//   void _selectImage(File pickedImage) {
//     _pickedImage = pickedImage;
//   }

//   // void _saveDecaissement() {
//   //   if (_titleController.text.isEmpty || _pickedImage == null) {
//   //     return;
//   //   }
//   // }

//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       final decaissementID =
//           ModalRoute.of(context)!.settings.arguments as String?;

//       if (decaissementID != null) {
//         _editDecaissement = Provider.of<Decaissements>(context, listen: false)
//             .findById(decaissementID);

//         _initialValues = {
//           'motif': '${_editDecaissement.idMtf}',
//           'beneficiaire': '${_editDecaissement.beneficiaire}',
//           'montant': '${_editDecaissement.montant.toString()}',
//           'date': '${_editDecaissement.datecreation}',
//           'commentaire': '${_editDecaissement.commentaire}',
//           'decaissementNum': '${_editDecaissement.numeroDecaissement}',
//         };
//       }
//     }
//     _isInit = false;
//     super.didChangeDependencies();
//   }

//   void _saveForm() {
//     var isValid = _formKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _formKey.currentState!.save();
//     if (_editDecaissement.idDecaissement != '') {

//       Provider.of<Decaissements>(context, listen: false).updateDecaissement(
//           '${_editDecaissement.idDecaissement}', _editDecaissement);
//     } else {
      
//       Provider.of<Decaissements>(context, listen: false)
//           .addDecaissement(_editDecaissement);
//     }

//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           const Text(
//             'Créer un décaissement',
//             style: TextStyle(fontSize: 20),
//           ),
//           Container(
//             margin: EdgeInsets.all(15),
//             height: 800,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(20)),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 20),
//                         alignment: Alignment.topLeft,
//                         child: RichText(
//                           text: const TextSpan(
//                               text: 'Motif',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20),
//                               children: [
//                                 TextSpan(
//                                     text: ' *',
//                                     style: TextStyle(
//                                       color: Colors.red,
//                                     ))
//                               ]),
//                           textScaleFactor: 1.0,
//                           maxLines: 5,
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Card(
//                         margin: EdgeInsets.only(left: 10, right: 10),
//                         elevation: 5,
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 10.9,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               border: Border.all(color: Colors.grey)),
//                           child: Container(
//                             margin: EdgeInsets.only(left: 10),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton(
//                                 isExpanded: true,
//                                 value: _selectedmotif,
//                                 onChanged: (Value) {
//                                   setState(() {
//                                     _selectedmotif = Value;
//                                   });
//                                 },
//                                 items: motifController.motifdecaissements!
//                                     .map((motif) {
//                                   return DropdownMenuItem(
//                                     child: new Text(motif.libelle),
//                                     value: motif.idMotif,
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   // Beneficiaire
//                   Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 20),
//                         alignment: Alignment.topLeft,
//                         child: RichText(
//                           text: TextSpan(
//                               text: 'Bénéficiaire',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20),
//                               children: [
//                                 TextSpan(
//                                     text: '*',
//                                     style: TextStyle(
//                                       color: Colors.red,
//                                     ))
//                               ]),
//                           textScaleFactor: 1.0,
//                           maxLines: 5,
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Card(
//                         margin: EdgeInsets.only(left: 10, right: 10),
//                         elevation: 5,
//                         child: Container(
//                           width: MediaQuery.of(context).size.width / 0.5,
//                           height: MediaQuery.of(context).size.height / 10.9,
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 border: Border.all(color: Colors.grey)),
//                             child: Container(
//                               margin: EdgeInsets.only(left: 10),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton(
//                                   isExpanded: true,
//                                   value: _selectedbeneficiaire,
//                                   onChanged: (Value) {
//                                     setState(() {
//                                       _selectedbeneficiaire = Value;
//                                     });
//                                   },
//                                   items: beneficiaireController
//                                       .beneficiairedecaissements!
//                                       .map((beneficiaire) {
//                                     return DropdownMenuItem(
//                                       child: new Text(beneficiaire.nom),
//                                       value: beneficiaire.idBeneficiaire,
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),

//                   //montant

//                   Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 20),
//                         alignment: Alignment.topLeft,
//                         child: RichText(
//                           text: TextSpan(
//                               text: 'Montant',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20),
//                               children: [
//                                 TextSpan(
//                                     text: ' *',
//                                     style: TextStyle(
//                                       color: Colors.red,
//                                     ))
//                               ]),
//                           textScaleFactor: 1.0,
//                           maxLines: 5,
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Card(
//                         margin: EdgeInsets.only(left: 10, right: 10),
//                         elevation: 5,
//                         child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height / 10.9,
//                             child: TextFormField(
//                               initialValue: _initialValues['montant'],
//                               validator: (value) {
//                                 if (value!.trim().isEmpty) {
//                                   return 'Ce champs ne doit pas etre vide';
//                                 }
//                               },
//                               onFieldSubmitted: (_) {
//                                 FocusScope.of(context)
//                                     .requestFocus(_beneficiaire);
//                               },
//                               onSaved: (value) {
//                                 _editDecaissement = Decaissement(
//                                   idDecaissement:
//                                       _editDecaissement.idDecaissement,
//                                   idMtf: _editDecaissement.idMtf,
//                                   idBnf: _editDecaissement.idBnf,
//                                   numeroDecaissement:
//                                       _editDecaissement.numeroDecaissement,
//                                   numeroPiece: _editDecaissement.numeroPiece,
//                                   montant: value.toString(),
//                                   beneficiaire: _editDecaissement.beneficiaire,
//                                   numeroBeneficiaire:
//                                       _editDecaissement.numeroBeneficiaire,
//                                   commentaire: _editDecaissement.commentaire,
//                                   dateRealisation:
//                                       _editDecaissement.dateRealisation,
//                                   photos: _editDecaissement.photos,
//                                   datecreation: _editDecaissement.datecreation,
//                                   idusrcreation:
//                                       _editDecaissement.idusrcreation,
//                                   idusrcreationStatut:
//                                       _editDecaissement.idusrcreationStatut,
//                                   commentaireStatut:
//                                       _editDecaissement.commentaireStatut,
//                                   datecreationStatut:
//                                       _editDecaissement.datecreationStatut,
//                                 );
//                               },
//                               textInputAction: TextInputAction.next,
//                               keyboardType: TextInputType.number,
//                               inputFormatters: [
//                                 ThousandsSeparatorInputFormatter()
//                               ],
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(),
//                               ),
//                             )),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 20),
//                         alignment: Alignment.topLeft,
//                         child: RichText(
//                           text: TextSpan(
//                               text: 'Date de réalisation',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20),
//                               children: [
//                                 TextSpan(
//                                     text: ' *',
//                                     style: TextStyle(
//                                       color: Colors.red,
//                                     ))
//                               ]),
//                           textScaleFactor: 1.0,
//                           maxLines: 5,
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Card(
//                         margin: EdgeInsets.only(left: 10, right: 10),
//                         elevation: 5,
//                         child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height / 10.9,
//                             child: TextFormField(
//                               initialValue:
//                                   _initialValues['Date de réalisation'],
//                               validator: (value) {
//                                 if (value!.trim().isEmpty) {
//                                   return 'Ce champs ne doit pas etre vide';
//                                 }
//                               },
//                               onFieldSubmitted: (_) {
//                                 FocusScope.of(context)
//                                     .requestFocus(_beneficiaire);
//                               },
//                               onSaved: (value) {
//                                 _editDecaissement = Decaissement(
//                                   idDecaissement:
//                                       _editDecaissement.idDecaissement,
//                                   idMtf: _editDecaissement.idMtf,
//                                   idBnf: _editDecaissement.idBnf,
//                                   numeroDecaissement:
//                                       _editDecaissement.numeroDecaissement,
//                                   numeroPiece: _editDecaissement.numeroPiece,
//                                   montant: _editDecaissement.montant,
//                                   beneficiaire: _editDecaissement.beneficiaire,
//                                   numeroBeneficiaire:
//                                       _editDecaissement.numeroBeneficiaire,
//                                   commentaire: _editDecaissement.commentaire,
//                                   dateRealisation:
//                                       _editDecaissement.dateRealisation,
//                                   photos: _editDecaissement.photos,
//                                   datecreation: value.toString(),
//                                   idusrcreation:
//                                       _editDecaissement.idusrcreation,
//                                   idusrcreationStatut:
//                                       _editDecaissement.idusrcreationStatut,
//                                   commentaireStatut:
//                                       _editDecaissement.commentaireStatut,
//                                   datecreationStatut:
//                                       _editDecaissement.datecreationStatut,
//                                 );
//                               },
//                               textInputAction: TextInputAction.next,
//                               keyboardType: TextInputType.datetime,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(),
//                               ),
//                             )),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height / 25,
//                   ),
//                   Card(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     elevation: 5,
//                     child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height / 9,
//                         child: TextField(
//                           style: TextStyle(height: 2),
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             hintText: 'Commentaire',
//                           ),

//                           //
//                         )),
//                   ),
//                   // Expanded(
//                     // child: InputImage(_selectImage),
//                   // ),
//                   // Container(
//                   //   child: ElevatedButton(
//                   //     child: Text(
//                   //       'Ajouter une photo',
//                   //       style: TextStyle(color: Colors.black),
//                   //     ),
//                   //     onPressed: () {
//                   //       Navigator.push(
//                   //         context,
//                   //         MaterialPageRoute(builder: (context) => Login()),
//                   //       );
//                   //     },
//                   //     style: ElevatedButton.styleFrom(
//                   //         primary: Colors.blue[900],
//                   //         padding:
//                   //             EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   //         textStyle: TextStyle(
//                   //             fontSize: 16, fontWeight: FontWeight.bold)),
//                   //   ),
//                   // ),
//                   Container(
//                     margin: EdgeInsets.all(15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           child: ElevatedButton(
//                             child: Text(
//                               'Annuler',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                   context, ListViewsInitie.routeName);
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 primary: Colors.red[900],
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 10),
//                                 textStyle: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold)),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 50,
//                         ),
//                         Container(
//                           child: ElevatedButton(
//                             child: Text(
//                               'Soumettre',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             onPressed: () {
//                               _saveForm();
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => ListViewsInitie()),
//                               // );
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 primary: Colors.blue[900],
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 10),
//                                 textStyle: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }





import 'package:date_field/date_field.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tim_app_build/controllers/beneficiaireController.dart';
import 'package:tim_app_build/controllers/motifController.dart';
import 'package:tim_app_build/listViews/listviews_initie.dart';
import 'package:tim_app_build/model/decaissement.dart';
import 'package:tim_app_build/provider/decaissement_providers.dart';
import 'package:tim_app_build/screen/thousandsSeparatorInputFormatter.dart';
import 'package:tim_app_build/services/decaissement_service.dart';
import 'package:tim_app_build/widgets/inputImage.dart';

class FormulaireDecaissement extends StatefulWidget {
  static const routeName = '/formulaire';
  const FormulaireDecaissement({Key? key}) : super(key: key);

  @override
  _FormulaireDecaissementState createState() => _FormulaireDecaissementState();
}

class _FormulaireDecaissementState extends State<FormulaireDecaissement> {
  final beneficiaireController = Get.put(BeneficiaireController());
  final motifController = Get.put(MotifController());
  DateTime? selectedDate;

  // List<String> _benef = [
  //   'CIE',
  //   'SODECI',
  //   'Logement',
  // ];
  var _selectedbeneficiaire;

  // List<String> _motf = [
  //   'Facture d\'eau',
  //   'Facture d\' electricité',
  //   'Facture du logement',
  // ];
  var _selectedmotif;
  var _selecteddate;
  var _selectedCommentaire;
  late String _selectedMontant;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final _titleController = TextEditingController();
  late File _pickedImage;

  final _beneficiaire = FocusNode();
  final _decaissementNum = FocusNode();
  final _montant = FocusNode();
  final _date = FocusNode();
  final _motif = FocusNode();
  final _commentaire = FocusNode();

  var _isInit = true;

  var _editDecaissement = Decaissement(
      idDecaissement: '',
      idMtf: '',
      idBnf: '',
      numeroDecaissement: '',
      numeroPiece: '',
      montant: '',
      beneficiaire: '',
      numeroBeneficiaire: '',
      commentaire: '',
      dateRealisation: '',
      photos: [],
      datecreation: '',
      idusrcreation: '',
      idusrcreationStatut: '',
      commentaireStatut: '',
      datecreationStatut: ''

      //File(),
      );
  var _initialValues = {
    'beneficiaire': '',
    'decaissementNum': '',
    'montant': '',
    'date': '',
    'motif': '',
    'commentaire': '',
  };

  @override
  void dispose() {
    _motif.dispose();

    _beneficiaire.dispose();
    _montant.dispose();
    _date.dispose();
    _commentaire.dispose();
    _decaissementNum.dispose();

    super.dispose();
  }

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  // void _saveDecaissement() {
  //   if (_titleController.text.isEmpty || _pickedImage == null) {
  //     return;
  //   }
  // }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final decaissementID =
          ModalRoute.of(context)!.settings.arguments as String?;

      if (decaissementID != null) {
        _editDecaissement = Provider.of<Decaissements>(context, listen: false)
            .findById(decaissementID);

        _initialValues = {
          'motif': '${_editDecaissement.idMtf}',
          'beneficiaire': '${_editDecaissement.beneficiaire}',
          'montant': '${_editDecaissement.montant.toString()}',
          'date': '${_editDecaissement.datecreation}',
          'commentaire': '${_editDecaissement.commentaire}',
          'decaissementNum': '${_editDecaissement.numeroDecaissement}',
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    var isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_editDecaissement.idDecaissement != '') {
      Provider.of<Decaissements>(context, listen: false).updateDecaissement(
          '${_editDecaissement.idDecaissement}', _editDecaissement);
    } else {
      Provider.of<Decaissements>(context, listen: false)
          .addDecaissement(_editDecaissement);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Créer un décaissement',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            height: 530,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20)),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: const TextSpan(
                              text: 'Motif',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ]),
                          textScaleFactor: 1.0,
                          maxLines: 5,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                value: _selectedmotif,
                                onChanged: (Value) {
                                  setState(() {
                                    _selectedmotif = Value;
                                  });
                                },
                                items: motifController.motifdecaissements!
                                    .map((motif) {
                                  return DropdownMenuItem(
                                    child: new Text(motif.libelle),
                                    value: motif.idMotif,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Beneficiaire
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                              text: 'Bénéficiaire',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ]),
                          textScaleFactor: 1.0,
                          maxLines: 5,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 0.5,
                          height: MediaQuery.of(context).size.height / 20,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey)),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: _selectedbeneficiaire,
                                  onChanged: (Value) {
                                    setState(() {
                                      _selectedbeneficiaire = Value;
                                    });
                                  },
                                  items: beneficiaireController
                                      .beneficiairedecaissements!
                                      .map((beneficiaire) {
                                    return DropdownMenuItem(
                                      child: new Text(beneficiaire.nom),
                                      value: beneficiaire.idBeneficiaire,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //montant

                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                              text: 'Montant',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ]),
                          textScaleFactor: 1.0,
                          maxLines: 5,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        elevation: 5,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 20,
                            child: TextFormField(
                              initialValue: _initialValues['montant'],
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Ce champs ne doit pas etre vide';
                                }
                              },
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_beneficiaire);
                              },
                              onChanged: (value) {
                                _selectedMontant = value;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                ThousandsSeparatorInputFormatter()
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                              text: 'Date de réalisation',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ]),
                          textScaleFactor: 1.0,
                          maxLines: 5,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Card(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          elevation: 5,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 12,
                            child: DateTimeFormField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(),
                              ),
                              firstDate: DateTime.now(),
                              initialDate:
                                  DateTime.now().add(const Duration(days: 10)),
                              mode: DateTimeFieldPickerMode.date,
                              autovalidateMode: AutovalidateMode.always,
                              validator: (DateTime? e) =>
                                  (e?.day ?? 0) == 1 ? '' : null,
                              onDateSelected: (DateTime value) {
                                print(value);
                                _selecteddate = value;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    elevation: 5,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 14,
                        child: TextField(
                          style: TextStyle(height: 2),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Commentaire',
                          ),
                          onChanged: (value) => _selectedCommentaire = value,

                          //
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                   // child: InputImage(_selectImage),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 5, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: ElevatedButton(
                            child: Text(
                              'Annuler',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ListViewsInitie.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red[900],
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: ElevatedButton(
                            child: Text(
                              'Soumettre',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              var execute = await InitierDecaissement(
                                  _selectedmotif,
                                  _selectedbeneficiaire,
                                  _selectedMontant.replaceAll('.', ''),
                                  _selecteddate,
                                  _selectedCommentaire, []);
                              print(execute);
                              if (execute == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListViewsInitie()),
                                );
                              } else {
                                print('initialisation échouée');
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => ListViewsInitie()),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue[900],
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}