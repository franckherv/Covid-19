
import 'package:e_commerce_flutterapp/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//My own import
//import 'home.dart';
import 'package:e_commerce_flutterapp/components/horizontal_listview.dart';

import 'components/products.dart';

void main(){


  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    )
  );
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {


    Widget image_carousel = Container(
      height: 200.00,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/c1.jpg"),
          AssetImage("images/m1.jpeg"),
          AssetImage("images/m2.jpg"),
          AssetImage("images/w1.jpeg"),
          AssetImage("images/w3.jpeg"),
          AssetImage("images/w4.jpeg"),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.red,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.red,
        title: Text("Flashapp 23 | 16:00"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white,),
              onPressed: (){

                Navigator.push(
                    context, MaterialPageRoute(builder: (context){
                      return Cart();
                  })
                );

                }
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //header
            UserAccountsDrawerHeader(
                accountName: Text("Jean Yves Ehouman"),
                accountEmail: Text("yvesehouman09@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red
              ),
            ),
            //body
            
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home, color: Colors.red,),
              ),
            ), //end InkWell
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("My account"),
                leading: Icon(Icons.person, color: Colors.red,),
              ),
            ), //end InkWell
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("My orders"),
                leading: Icon(Icons.shopping_basket, color: Colors.red,),
              ),
            ), //end InkWell
            InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context){
                      return Cart();
                    }
                )

                );
              },
              child: ListTile(
                title: Text("Shopping cart"),
                leading: Icon(Icons.shopping_cart, color: Colors.red,),
              ),
            ), //end InkWell
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ), //end InkWell

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(
                    Icons.settings
                ),
              ),
            ), //end InkWell
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                ),
              ),
            ), //end InkWell

          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          //image carousel
          image_carousel,
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Categories")
              ),
          ),

          HorizotalList(),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text("Recent products")
            ),
          ),

          Flexible(child: Products()),
          
          /*Container(
            height: 320.0,
            child: Products(),
          )*/
          
        ],
      ),
    );
  }
}


