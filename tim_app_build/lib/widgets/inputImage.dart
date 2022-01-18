// // ignore_for_file: import_of_legacy_library_into_null_safe
// import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

// class InputImage extends StatefulWidget {
//   final Function onSelectImage;
//   InputImage(this.onSelectImage);

//   @override
//   _InputImageState createState() => _InputImageState();
// }

// class _InputImageState extends State<InputImage> {
//   File? _storedImage;
//   Future<void> _takePicture() async {
//     final picker = ImagePicker();
//     final imageFile =
//         await picker.pickImage(source: ImageSource.camera, maxWidth: 600);

//     setState(() {
//       _storedImage = File(imageFile!.path);
//     });
//     // final appDir = await syspaths.getApplicationDocumentsDirectory();
//     // final fileName = path.basename(imageFile!.path);
//     // final savedImage =
//     //     await File(imageFile.path).copy('${appDir.path}/$fileName');
//     // widget.onSelectImage(savedImage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 300,
//       margin: EdgeInsets.only(top: 10),
//       child: Row(children: [
//         Container(
//           height: 100,
//           width: 100,
//           decoration: BoxDecoration(
//               //borderRadius: BorderRadius.circular(10),
//               border: Border.all(width: 1, color: Colors.grey)),
//           child: _storedImage != null
//               ? Image.file(
//                   _storedImage!,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 )
//               : Text('Aucune Image'),
//           alignment: Alignment.center,
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: TextButton.icon(
//               onPressed: _takePicture,
//               icon: Icon(
//                 Icons.camera_alt,
//               ),
//               label: Text(
//                 'Ajouter une photo',
//                 textAlign: TextAlign.center,
//               )),
//         )
//       ]),
//     );
//   }
// }

// ImagePicker() {
// }



