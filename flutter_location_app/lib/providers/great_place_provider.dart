import 'dart:io';

import 'package:flutter/foundation.dart';
import '../helpers/db_helpers.dart';
import '../models/place_model.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        image: pickedImage,
        location: null);
    _items.add(newPlace);

    notifyListeners();
    DBHelper.insert("table", {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  List<Place> get items => [..._items];
}
