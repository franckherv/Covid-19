import 'package:flutter/material.dart';


//class HomePage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//
//    return Container(
//      color: Colors.white,
//      child: Column(
//        children: <Widget>[
//          Icon(Icons.person, color: Colors.black,),
//          Text("User", style: TextStyle(color: Colors.black,),)
//        ],
//      ),
//    );
//  }
//
//
//
//}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("I am stateFul"),
    );
  }
}
