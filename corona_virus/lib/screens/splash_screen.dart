import 'dart:async';

import 'package:corona_virus/screens/first_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
@override
void initState() {
	super.initState();
	Timer(Duration(seconds: 3),
		()=>Navigator.pushReplacement(context,
										MaterialPageRoute(builder:
														(context) =>
														FirstScreen()
														)
									)
		);
}
@override
Widget build(BuildContext context) {
	return Scaffold(
	body: Center(child: CircularProgressIndicator()),
	);
}
}