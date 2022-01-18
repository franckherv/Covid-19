// import 'package:flutter/material.dart';
// import 'package:tim_app_build/widgets/navigationDrawer.dart';

// class PageAcceuil extends StatelessWidget {
//   const PageAcceuil({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blue[900],
//       ),
//       drawer: NavigationDrawer(),
//       body: Stack(children: [
//         Positioned(
//           child: Column(children: [
//             Expanded(
//                 flex: 1,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.blue[900],
//                       borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(30),
//                           bottomRight: Radius.circular(30))),
//                 )),
//             Expanded(
//                 child: Container(
//               color: Colors.white,
//             )),
//           ]),
//         ),
//         Positioned(
//           top: 20,
//           left: 10,
//           height: MediaQuery.of(context).size.height / 7,
//           width: MediaQuery.of(context).size.width / 1,
//           child: Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width / 1,
//               height: MediaQuery.of(context).size.width / 1,
//               child: Image(
//                 image: AssetImage('images/logobillsoft.png'),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 200,
//           left: 7,
//           height: MediaQuery.of(context).size.height / 4,
//           width: MediaQuery.of(context).size.width / 1,
//           child: Container(
//             margin: EdgeInsets.only(right: 10),
//             child: Card(
//               elevation: 20,
//               child: Center(
//                 child: Container(
//                   margin: const EdgeInsets.all(10),
//                   child: Column(children: [
//                     Container(
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'BIENVENUE SUR ',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             // fontFamily: 'DancingScript',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 25),
//                       // alignment: Alignment.center,
//                       child: const Text(
//                         '       VOTRE GESTIONNAIRE  D\'ENTREES ET DE SORTIES DE',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             // fontFamily: 'DancingScript',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 80,
//                     ),
//                     Container(
//                       child: const Text(
//                         'CAISSE ',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             // fontFamily: 'DancingScript',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ]),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tim_app_build/listViews/listviews_en_attente.dart';
import 'package:tim_app_build/listViews/listviews_initie.dart';
import 'package:tim_app_build/listViews/listviews_refuse.dart';
import 'package:tim_app_build/listViews/listviews_valide.dart';
import 'package:tim_app_build/model/decaissement.dart';
import 'package:tim_app_build/services/decaissement_service.dart';
import 'package:tim_app_build/widgets/navigationDrawer.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({Key? key}) : super(key: key);

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      drawer: NavigationDrawer(),
      body: SafeArea(
        child: buildColumn(),
      ),

      /*Stack(children: [
        Positioned(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  // child: Image(
                  //   image: NetworkImage(
                  //       'https://picsum.photos/seed/picsum/400/300'),
                  // )
                )),
            Expanded(
              flex: 2,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 90,
                      height: 100,
                      color: Colors.red,
                      child: Center(child: Text('gdddhdh')),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 90,
                      height: 100,
                      color: Colors.red,
                      child: Center(child: Text('gdddhdh')),
                    ),
                    
                  ],
                ),

                Row(
              mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(
                  width: 5,
                ),
                Container(
                  width: 90,
                  height: 100,
                  color: Colors.red,
                  child: Center(child: Text('gdddhdh')),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 90,
                  height: 100,
                  color: Colors.red,
                  child: Center(child: Text('gdddhdh')),
                ),
                  ],
                )
              ],
            )),
          ]),
        ),
        Positioned(
          top: 20,
          left: 10,
          height: MediaQuery.of(context).size.height / 7,
          width: MediaQuery.of(context).size.width / 1,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.width / 1,
              child: Image(
                image: AssetImage('images/logobillsoft.png'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 180,
          left: 7,
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 1,
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Card(
              elevation: 20,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'BIENVENUE SUR ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            // fontFamily: 'DancingScript',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25),
                      // alignment: Alignment.center,
                      child: const Text(
                        '       VOTRE GESTIONNAIRE  D\'ENTREES ET DE SORTIES DE',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            // fontFamily: 'DancingScript',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Container(
                      child: const Text(
                        'CAISSE ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            // fontFamily: 'DancingScript',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ]), */
    );
  }

  Widget buildColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // First blue container
          _buildTopContainer(),
          // Button with offset
          _buildMidContainerWithButton(),
          // Bottom white container
          _buildBottomContainer(),
        ],
      );

  Widget _buildTopContainer() => Flexible(
        flex: 4,
        child: Container(
          color: Colors.blue[900],
          child: Image.asset('images/logobillsoft.png'),
        ),
      );

  Widget _buildMidContainerWithButton() {
    final buttonHeight = 80.0;
    return Stack(
      children: [
        // Use same background color like the second container
        Container(
          height: buttonHeight,
          color: Colors.blue[900],
        ),
        // Translate the button
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1,
              padding: const EdgeInsets.fromLTRB(24.0, 3.0, 24.0, 0.0),
              child: Text(
                'BIENVENUE SUR VOTRE GESTIONNAIRE  D\'ENTREES ET DE SORTIES DE CAISSE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    // fontFamily: 'DancingScript',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomContainer() => Flexible(
      flex: 7,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            color: Colors.black,
          ),
          Positioned(
              top: 30,
              left: 20,
              child: Container(
                width: 100,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListViewsInitie()),
                      );
                    },
                    child: Center(
                      child: Container(
                        child: Text(
                          'Décaissements Initiés',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              )),
          Positioned(
              top: 5,
              left: 155,
              child: Container(
                child: FutureBuilder<List<Decaissement>>(
                    future: fetchDecaissement(1),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 10,
                            alignment: Alignment.center,
                            child: Text(
                              '${snapshot.data!.length}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[900]),
                width: 30,
                height: 30,
              )),
          Positioned(
              top: 10,
              right: 20,
              child: Card(
                elevation: 30,
                child: Container(
                  width: 100,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListViewsEnAttente()),
                        );
                      },
                      child: Center(
                        child: Container(
                          child: Text(
                            'Décaissements En Attentes',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ),
              )),
          Positioned(
              top: 5,
              left: 370,
              child: Container(
                child: FutureBuilder<List<Decaissement>>(
                    future: fetchDecaissement(2),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 10,
                            alignment: Alignment.center,
                            child: Text(
                              '${snapshot.data!.length}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[900]),
                width: 30,
                height: 30,
              )),
          Positioned(
              bottom: 10,
              right: 20,
              child: Container(
                width: 100,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListViewsRefus()),
                      );
                    },
                    child: Center(
                      child: Container(
                        child: Text(
                          'Décaissements Refusés',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              )),
          Positioned(
              bottom: 100,
              left: 370,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[900]),
                width: 30,
                height: 30,
                child: FutureBuilder<List<Decaissement>>(
                    future: fetchDecaissement(4),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 10,
                            alignment: Alignment.center,
                            child: Text(
                              '${snapshot.data!.length}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              )),
          Positioned(
              bottom: 40,
              left: 30,
              child: Container(
                width: 100,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListViewsValide()),
                      );
                    },
                    child: Center(
                      child: Container(
                        child: Text(
                          'Décaissements Validés',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              )),
          Positioned(
              bottom: 90,
              left: 160,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[900]),
                  width: 30,
                  height: 30,
                  child: FutureBuilder<List<Decaissement>>(
                      future: fetchDecaissement(3),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 10,
                              alignment: Alignment.center,
                              child: Text(
                                '${snapshot.data!.length}',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ));
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }))),
        ],
      ));
}
