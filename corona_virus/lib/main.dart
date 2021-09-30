import 'dart:async';
import 'package:corona_virus/providers/person_provider.dart';
import 'package:corona_virus/screens/edit_screen.dart';
import 'package:corona_virus/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Persons(),
        ),
    ],
	  child: MaterialApp(
    debugShowCheckedModeBanner: false,
	  title: 'Splash Screen',
	  theme: ThemeData(
     fontFamily: 'Cairo',
	  ),
	  home: MyHomePage(),
	   routes: {
       BottomShetWidget.routeName: (cxt) => BottomShetWidget(),
     },
	  ),
	);
   
}
}


