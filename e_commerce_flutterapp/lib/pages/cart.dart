import 'package:e_commerce_flutterapp/components/cart_products.dart';
import 'package:flutter/material.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.red,
        title: Text("Cart"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
        ],
      ),

      body: CartProducts(),

      bottomNavigationBar: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
                  title: Text("Total: "),
                  subtitle: Text("\$230"),
                )
            ),
            Expanded(
                child: MaterialButton(

                    onPressed: (){

                    },
                  
                    child: Text(
                        "Check out",
                        style: TextStyle(
                            color: Colors.white
                        ),
                    ),

                color: Colors.red,
                ),
            )
          ],
        ),
      ),
    );
  }
}
