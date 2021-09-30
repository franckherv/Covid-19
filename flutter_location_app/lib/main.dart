import 'package:flutter/material.dart';
import '../screens/add_place_screen.dart';
import '../providers/great_place_provider.dart';
import './screens/places_list_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.indigo,
        ),
        home: PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName : (cxt) => AddPlaceScreen()
        },
      ),
    );
  }
}
