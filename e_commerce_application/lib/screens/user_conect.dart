import 'package:e_commerce_application/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsPro>(context, listen: false).login();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
              child: ElevatedButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () =>_isLoading ? CircularProgressIndicator() : provider ,
            child: Text("S'inscrire/ Se connecter avec google"),
          )),
          
        ],
      ),
    );
  }
}
