import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_application/providers/product_provider.dart';
import 'package:e_commerce_application/screens/home_screen..dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
                 Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'IceShop vous souhaite la bienvenu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
        Container(
          padding: EdgeInsets.all(4),
          child: OutlinedButton.icon(
            
            onPressed: () {
               final provider =
                Provider.of<ProductsPro>(context, listen: false);
            provider.login();
            },
            label: Text("Google connexion",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
            style: OutlinedButton.styleFrom(
              
              side: BorderSide(color: Colors.black),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              shape: StadiumBorder(),
              ),
            
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text("Connecte-vous pour continuer", style: TextStyle(fontSize: 16),),
        Spacer(),
        
        
      ],
    ),
    );
  }
}
