import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectedImage;

  const ImageInput(this.onSelectedImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  var _storedImage;

  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = imageFile;
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');

    widget.onSelectedImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          width: 150,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _storedImage != null
              ? Image.file(
                  File(_storedImage.path),
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text("Aucune image prise", textAlign: TextAlign.center),
        ),
        SizedBox(
          width: 10,
        ),
        TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text('photo'))
      ],
    );
  }
}
