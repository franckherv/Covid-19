import 'package:e_commerce_application/widgets/app_drawer_menu.dart';
import 'package:e_commerce_application/widgets/cart_product_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
        backgroundColor: Color(0xff254A60),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: CartProductWidget(),
       drawer: AppDrawer(),
       bottomNavigationBar: Container(
         color: Colors.white,
         child: Row(
           children: [
             Expanded(child: ListTile(
               title: Text("TOTAL"),
               subtitle: Text("25000"),
             )),

             Expanded(child: MaterialButton(
               color: Color(0xff254A60),
               child: Text("Acheter", style: TextStyle(color: Colors.white, fontSize: 18)),
               onPressed: (){

               },
             ))
           ],
         ),
       ),
    );
  }
}