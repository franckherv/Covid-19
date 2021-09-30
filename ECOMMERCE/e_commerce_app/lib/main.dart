import 'package:e_commerce_app/componts/products.dart';
import './componts/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget appingBuild(Function tape, String title, IconData icon, Color color) {
    return InkWell(
      onTap: tape,
      child: ListTile(
        title: Text(title),
        leading: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget imagecaroussel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/img3.webp"),
          AssetImage("images/img1.jpg"),
          AssetImage("images/img2.jpg"),
          AssetImage("images/img4.jpg"),
          AssetImage("images/img5.webp"),
        ],
        autoplay: false,
        dotSize: 4,
        indicatorBgPadding: 10,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("FlashApp"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("FamaShop"),
              accountEmail: Text("famashop@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 30, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            appingBuild(() {}, "Accueil", Icons.home, Colors.red),
            appingBuild(() {}, "Mon compte", Icons.person, Colors.red),
            appingBuild(() {}, "Listes", Icons.shopping_basket, Colors.red),
            appingBuild(() {}, "Cathégorie", Icons.category, Colors.red),
            appingBuild(() {}, "Favoris", Icons.favorite, Colors.red),
            Divider(
              height: 10,
            ),
            appingBuild(() {}, "Paramètre", Icons.settings, Colors.grey),
            appingBuild(() {}, "About", Icons.help, Colors.blue),
          ],
        ),
      ),
      body: ListView(
        children: [
          imagecaroussel,
          Padding(
            padding: EdgeInsets.all(8),
            child: Text("Cathégorie"),
          ),
          HorizontalList(),
            Padding(
            padding: EdgeInsets.all(20),
            child: Text("Produits recents"),
          ),

          Container(
            height: MediaQuery.of(context).size.height/3,
            child: Products(),
          )
        ],
      ),
    );
  }
}
