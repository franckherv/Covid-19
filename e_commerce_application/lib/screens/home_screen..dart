import 'package:e_commerce_application/screens/cart.dart';

import '../widgets/app_drawer_menu.dart';
import '../widgets/home_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Color(0xff254A60),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => CartScreen()));
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: HomeWidget(),
    );
  }
}
