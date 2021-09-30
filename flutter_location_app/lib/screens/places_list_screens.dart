import 'dart:io';

import 'package:flutter/material.dart';
import '../providers/great_place_provider.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Votre Places"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: Center(
            child: const Text("ajoutez la places"),
            ),
           builder: (cxt, greatplace, ch) => 
           greatplace.items.length <= 0 ? ch as Widget : 
           ListView.builder(
             itemCount: greatplace.items.length,
             itemBuilder: (context, i) => ListTile(
               leading: CircleAvatar(
                 backgroundImage: FileImage(File(greatplace.items[i].image.path)),
               ),
               title: Text("${greatplace.items[i].title}"),
               onTap: (){
                 // got to detail screen
               },
             ),
           ),)
        );
  } 
}
