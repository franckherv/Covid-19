
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:tim_app_build/controllers/motifController.dart';
// import 'package:tim_app_build/provider/decaissement_providers.dart';
// import 'package:tim_app_build/screen/image_screen.dart';

// class DetailsDecaissementEnAttente extends StatelessWidget {
//   static const routeName = '/decaissement-details-enattente';
//   @override
//   Widget build(BuildContext context) {
//     //final decaissementData = Provider.of<Decaissements>(context).items;
//     // final decaissements = decaissementData;
//     final decaissementId = ModalRoute.of(context)!.settings.arguments as String;
//     final detail = Provider.of<Decaissements>(context).findById(
//       decaissementId,
//     );
//     final motifController = Get.put(MotifController());

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           Card(
//             elevation: 10,
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               height: 500,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(),
//                   borderRadius: BorderRadius.circular(20)),
//               child: Column(
//                 children: [
//                   Card(
//                     elevation: 10,
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 20),
//                       height: 70,
//                       width: 300,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Column(children: [
//                               const Text(
//                                 'Bénéficiaire',
//                                 style: TextStyle(fontSize: 13),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   child: SingleChildScrollView(
//                                     child: Text('${detail.beneficiaire}',
//                                         style: TextStyle(
//                                           color: Colors.red,
//                                           fontSize: 13,
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                             ]),
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Expanded(
//                             child: Container(
//                               child: Column(children: [
//                                 const Text('Montant'),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(detail.montant.toString(),
//                                     style: TextStyle(
//                                       color: Colors.red,
//                                       fontSize: 13,
//                                     )),
//                               ]),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Expanded(
//                             child: Column(children: [
//                               const Text('N°Beneficiaire',
//                                   style: TextStyle(
//                                     fontSize: 13,
//                                   )),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 '${detail.numeroBeneficiaire}',
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ]),
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     child: Column(
//                       children: [
//                         Text(
//                           'N° du décaissement:',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         Text('${detail.numeroDecaissement}',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 10),
//                     child: Column(
//                       children: [
//                         Row(children: [
//                           Text(
//                             'Motif:',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(left: 5),
//                               height: 30,
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.vertical,
//                                 child: Text(
//                                     '${motifController.getLibelleMotif(detail.idMtf)}',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     )),
//                               ),
//                             ),
//                           ),
//                         ]),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                             child: Row(
//                           children: [
//                             Text(
//                               'Commentaire:',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 16),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 margin: EdgeInsets.only(left: 5),
//                                 child: SingleChildScrollView(
//                                   scrollDirection: Axis.vertical,
//                                   child: Text('${detail.commentaire}',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 16,
//                                       )),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(children: [
//                           Text(
//                             'Date Décaissement:',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.only(left: 5),
//                             child: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Text('${detail.datecreation}',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                   )),
//                             ),
//                           ),
//                         ]),
//                         SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                   Container(
//                       child: ElevatedButton(
//                           child: Text(
//                             'voir image',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           onPressed: () {
//                             Navigator.pushNamed(context, ImageScreen.routeName,
//                                 arguments: detail.idDecaissement);
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => Login()),
//                             // );
//                           },
//                           style: ElevatedButton.styleFrom(
//                               fixedSize: Size(150, 50),
//                               primary: Colors.blue[900],
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                               textStyle: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold)))),
//                 ],
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tim_app_build/controllers/motifController.dart';
import 'package:tim_app_build/provider/decaissement_providers.dart';
import 'package:tim_app_build/screen/image_screen.dart';

class DetailsDecaissementEnAttente extends StatelessWidget {
  static const routeName = '/decaissement-details-enattente';
  @override
  Widget build(BuildContext context) {
    //final decaissementData = Provider.of<Decaissements>(context).items;
    // final decaissements = decaissementData;
    final decaissementId = ModalRoute.of(context)!.settings.arguments as String;
    final detail = Provider.of<Decaissements>(context).findById(
      decaissementId,
    );
    final motifController = Get.put(MotifController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Dec N°${detail.numeroDecaissement}'),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Card(
            margin: EdgeInsets.only(top: 50),
            elevation: 10,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 450,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 70,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(children: [
                              const Text(
                                'Bénéficiaire',
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Text('${detail.beneficiaire}',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 13,
                                        )),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(children: [
                                const Text('Montant'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(detail.montant.toString(),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13,
                                    )),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          // Expanded(
                          //   child: Column(children: [
                          //     const Text('N°Beneficiaire',
                          //         style: TextStyle(
                          //           fontSize: 13,
                          //         )),
                          //     SizedBox(
                          //       height: 10,
                          //     ),
                          //     Text(
                          //       '${detail.numeroBeneficiaire}',
                          //       style: TextStyle(
                          //         color: Colors.red,
                          //         fontSize: 13,
                          //       ),
                          //     ),
                          //   ]),
                          // ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         'N° du décaissement:',
                  //         style: TextStyle(
                  //             fontSize: 16, fontWeight: FontWeight.bold),
                  //       ),
                  //       Text('${detail.numeroDecaissement}',
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.bold)),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            'Motif:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              height: 30,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                    '${motifController.getLibelleMotif(detail.idMtf)}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: Row(
                          children: [
                            Text(
                              'Commentaire:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text('${detail.commentaire}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          Text(
                            'Date Décaissement:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text('${detail.datecreation}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  )),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      child: ElevatedButton(
                          child: Text(
                            'voir image',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, ImageScreen.routeName,
                                arguments: detail.idDecaissement);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Login()),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(150, 50),
                              primary: Colors.blue[900],
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)))),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}