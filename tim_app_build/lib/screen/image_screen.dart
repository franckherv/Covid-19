// import 'package:flutter/material.dart';

// class ImageScreen extends StatefulWidget {
//   static const routeName = '/image-screen';

//   @override
//   State<ImageScreen> createState() => _ImageScreenState();
// }

// class _ImageScreenState extends State<ImageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//         backgroundColor: Colors.blue[900],
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Container(
//                 margin: EdgeInsets.all(20),
//                 height: 500,
//                 width: 400,
//                 decoration: new BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: AssetImage('images/cie.jpg'),
//                       fit: BoxFit.fill,
//                     ))),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tim_app_build/config/variable_environnement.dart';
import 'package:tim_app_build/controllers/decaissementController.dart';
import 'package:tim_app_build/provider/decaissement_providers.dart';

class ImageScreen extends StatefulWidget {
  final decaissementController = Get.put(DecaissementController());

  static const routeName = '/image-screen';

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {



  @override
  Widget build(BuildContext context) {

    

    final id = ModalRoute.of(context)!.settings.arguments as String;
    final detail = Provider.of<Decaissements>(context).findById(id); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Dec N°${detail.numeroDecaissement}'),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              // child: Container(
              //     margin: EdgeInsets.all(20),
              //     height: 500,
              //     width: 400,
              //     decoration: new BoxDecoration(
              //         image: DecorationImage(
              //       image: NetworkImage(VariableEnvironnement().imageBaseUrl +
              //           detail.photos![0].libelle),
              //       fit: BoxFit.fill,
              //     ))),
              child: (detail.photos!.length > 0 && detail.photos![0].libelle == null)
                  ? Text('Aucune Image')
                  : GestureDetector(
                    onDoubleTapDown: _handleDoubleTapDown,
                    onDoubleTap: _handleDoubleTap,
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                        panEnabled: false, // Set it to false to prevent panning.
                        boundaryMargin: EdgeInsets.all(80),
                        minScale: 0.5,
                        maxScale: 4,
                        child: Container(
                            margin: EdgeInsets.all(20),
                            height: 500,
                            width: 400,
                            decoration: new BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  VariableEnvironnement().imageBaseUrl +
                                      detail.photos![0].libelle),
                              fit: BoxFit.fill,
                            ))),
                      ),
                  ),
            )
          ],
        ),
      ),
    );
  }

final _transformationController = TransformationController();
late TapDownDetails _doubleTapDetails;

void _handleDoubleTapDown(TapDownDetails details) {
  _doubleTapDetails = details;
}

void _handleDoubleTap() {
  if (_transformationController.value != Matrix4.identity()) {
    _transformationController.value = Matrix4.identity();
  } else {
    final position = _doubleTapDetails.localPosition;
    // For a 3x zoom
    _transformationController.value = Matrix4.identity()
      ..translate(-position.dx * 2, -position.dy * 2)
      ..scale(3.0);
    // Fox a 2x zoom
    // ..translate(-position.dx, -position.dy)
    // ..scale(2.0);
  }
}

}
