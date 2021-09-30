import '../screens/home_screen..dart';

import '../screens/cart.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Widget drawerfunction(String text, IconData icon, Function tap, Color color) {
    return ListTile(
        title: Text(text),
        leading: Icon(
          icon,
          color: color,
        ),
        onTap: () => tap);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff254A60),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            accountName: Text("VGENTREPRISE"),
            accountEmail: Text("vgentreprise@gmail.com"),
          ),
          
        
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            title: Text("Accueil"),
            leading: Icon(
              Icons.home,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            title: Text("Mon compte"),
            leading: Icon(
              Icons.person,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            title: Text("Mes commandes"),
            leading: Icon(Icons.payment),
          ),
          ListTile(
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            title: Text("Favoris"),
            leading: Icon(Icons.favorite),
          ),
          ListTile(
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            title: Text("Panier"),
            leading: Icon(Icons.shopping_cart),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => CartScreen()));
            },
            title: Text("Paramètre"),
            leading: Icon(
              Icons.settings
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            title: Text("Info"),
            leading: Icon(
              Icons.info_rounded
            ),
          ),
          
        ],
      ),
    );
  }
}
