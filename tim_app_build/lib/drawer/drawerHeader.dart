import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_app_build/controllers/userController.dart';

Widget drawerHeader() {
  final userController = Get.put(UserController());

  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: Colors.blue[900]),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                child: Icon(
                  Icons.person,
                  size: 70,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      '${userController.user!.nom}',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text('${userController.user!.prenom}',
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              )
            ])),
      ]));
}
