import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_location_app/providers/great_place_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();

  var _pickedImage;

  void _selecteImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void savePlace() {
    if (titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Ajout de place"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'title'),
                      controller: titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(_selecteImage)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            onPressed: savePlace,
            icon: Icon(Icons.add),
            label: Text('Ajouter'),
          ),
        ],
      ),
    );
  }
}
