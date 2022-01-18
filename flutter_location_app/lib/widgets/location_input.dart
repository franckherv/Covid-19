import 'package:flutter/material.dart';
import '../helpers/location_helper.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  var _previewImageUrl;

  Future<void> _getUserCurrentLocation() async {
    final locData = await Location().getLocation();
    final staticMapPreviewImageUrl =
        LocationHelper.generateLocationPreviewImage(
            latitude: locData.latitude, 
            longitude: locData.longitude
            );

    setState(() {
      _previewImageUrl = staticMapPreviewImageUrl;
    });
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text("Aucune localisation choisie", textAlign: TextAlign.center)
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton.icon(
              onPressed: _getUserCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text("Position actuelle")),
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text("selection")),
        ])
      ],
    );
  }
}
