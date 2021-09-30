import 'package:e_commerce_application/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProductsPro with ChangeNotifier {
  List<Products> _items = [
    Products(
        id: "m1",
        title: "Veste",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
        oldPrice: 59000,
        newPrice: 50000,
        imageUrl: "images/shop/bloser.jpg"),
    Products(
        id: "m2",
        title: "Chaussure",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
        oldPrice: 10000,
        newPrice: 9000,
        imageUrl: "images/shop/chaussure.jpg"),
    Products(
        id: "m3",
        title: "Chaussure",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
        oldPrice: 12000,
        newPrice: 10000,
        imageUrl: "images/shop/chaussure2.jpg"),
    Products(
        id: "m4",
        title: "Chemise",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
        oldPrice: 6000,
        newPrice: 5250,
        imageUrl: "images/shop/chemise.jpg"),
    Products(
        id: "m5",
        title: "Robe",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
        oldPrice: 3000,
        newPrice: 2800,
        imageUrl: "images/shop/rose.jpg"),
    Products(
        id: "m6",
        title: "Robe",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
        oldPrice: 4000,
        newPrice: 3800,
        imageUrl: "images/shop/rose2.jpg"),
    Products(
        id: "m7",
        title: "jupe",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
        oldPrice: 4000,
        newPrice: 3800,
        imageUrl: "images/shop/jupe.jpg"),
  ];

  List<Products> get items => [..._items];

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  //late bool _isSigningIn;

  GoogleSignInAccount get user => _user!;

  // googleSignInProvider() {
  //   _isSigningIn = false;
  // }

  // bool get isSigningIn => _isSigningIn;

  // set isSigningIn(bool isSigningIn) {
  //   _isSigningIn = isSigningIn;
  //   notifyListeners();
  // }

  Future login() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return;

    _user = googleUser;
    final googleAuth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    // if (user == null) {
    //   isSigningIn = false;
    //   return;
    // } else {
    //   final googleAuth = await user.authentication;

    //

    //   isSigningIn = false;
    // }
    notifyListeners();
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
