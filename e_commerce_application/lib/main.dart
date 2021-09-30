// @dart=2.9



import 'package:e_commerce_application/screens/google%20_home_page.dart';

import './providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../screens/login_screen.dart';

import './screens/home_screen..dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProductsPro(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.blue),
        home: GoogleHomePage(),
      ),
    );
  }
}
