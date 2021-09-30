import '../screens/home_screen..dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'user_conect.dart';

class GoogleHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasData) {
            return UserLogin();
          }
           else if (snapshot.hasError) {
            return Center(child: Text("Oups !!!"),);
          }
          return Container();
        },
      ),
    );
  }
}
