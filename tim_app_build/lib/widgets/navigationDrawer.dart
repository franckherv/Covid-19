import 'package:flutter/material.dart';
import 'package:tim_app_build/drawer/drawerHeader.dart';
import 'package:tim_app_build/listViews/listviews_en_attente.dart';
import 'package:tim_app_build/listViews/listviews_initie.dart';
import 'package:tim_app_build/listViews/listviews_refuse.dart';
import 'package:tim_app_build/listViews/listviews_valide.dart';
import 'package:tim_app_build/pages/firstPage.dart';

class NavigationDrawer extends StatelessWidget {
  late final String id;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        drawerHeader(),
        ListTile(
          title: const Text('Décaissements initiés'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListViewsInitie()),
            );
          },
        ),
        ListTile(
          title: const Text('Décaissements en attentes'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListViewsEnAttente()),
            );
          },
        ),
        ListTile(
          title: const Text('Décaissements validés'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListViewsValide()),
            );
          },
        ),
        ListTile(
          title: const Text('Décaissements refusés'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListViewsRefus()),
            );
          },
        ),
        SizedBox(
          height: 100,
        ),
        Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstPage()),
            );
          },
          child: Text("Deconnexion"),
          style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 50),
              primary: Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        )),
      ]),
    );
  }
}
