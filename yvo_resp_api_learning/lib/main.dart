
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yvo_resp_api_learning/screens/home_screen.dart';
import 'package:yvo_resp_api_learning/screens/user_detail_screen.dart';
import 'package:yvo_resp_api_learning/widgets/custum_animation.dart';

void main() {
  configLoading();
  runApp(MyApp());
}

void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.brown
      ),
      home: HomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}

