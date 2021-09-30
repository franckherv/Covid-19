
import 'package:crud_app/models/user_model.dart';
import 'package:crud_app/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  UserItem({ this.item});
  
  final Users item;
  
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetaiScreen(user: item)));
      },
      child: Container(
          padding: EdgeInsets.all(2),
          height: 140,
          child: Card(
            elevation: 5,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(item.firstName),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(this.item.title,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${this.item.lastName}"),
                            ],
                          )))
                ]),
          )),
    );
  }
}