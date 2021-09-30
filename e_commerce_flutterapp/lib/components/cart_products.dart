import 'package:flutter/material.dart';



class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var products_on_the_cart = [
    {
      "name":"Shoes",
      "picture":"images/products/hills1.jpeg",
      "price":50,
      "size": "7",
      "color": "Red",
      "quantity":1
    },
    {
      "name":"Red dress",
      "picture":"images/products/skt1.jpeg",
      "price":100,
      "size": "M",
      "color": "Black",
      "quantity":1
    }

  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: products_on_the_cart.length,
        itemBuilder: (context, index){

          return  Single_cart_product(
              cart_product_name: products_on_the_cart[index]["name"],
              cart_product_color: products_on_the_cart[index]["color"],
              cart_product_price: products_on_the_cart[index]["price"],
              cart_product_picture: products_on_the_cart[index]["picture"],
              cart_product_quantity: products_on_the_cart[index]["quantity"],
              cart_product_size: products_on_the_cart[index]["size"]
          );

        }
    );

  }
}


class Single_cart_product extends StatelessWidget {

  String cart_product_name = "";
  String cart_product_picture = "";
  int cart_product_price = 0;
  int cart_product_quantity = 0;
  String cart_product_size = "";
  String cart_product_color = "";

  Single_cart_product({
      this.cart_product_name,
      this.cart_product_color,
      this.cart_product_price,
      this.cart_product_picture,
      this.cart_product_quantity,
      this.cart_product_size
    });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        /**
         * leading:Container(
            width: 100.0,
            height: 100.0,
            child: Image.asset(
            cart_product_picture,
            fit: BoxFit.fill
            ),
            ),
         *
         */

        leading: Image.asset(
            cart_product_picture,
            width: 80.0,
            height: 80.0,
        ),
        title: Text(cart_product_name),
        subtitle: Column(
          children: <Widget>[

            //start Row inside the column
            Row(
              children: <Widget>[
                //***Start: This section is for the size of product
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                      cart_product_size,
                      style: TextStyle(
                        color: Colors.red
                      ),
                  ),
                ), //******End: This section is for the size of product

                //###########Start: This section is for the color of product
                Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: Text("Color:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                      cart_product_color,
                      style: TextStyle(
                          color: Colors.red
                      ),
                  ),
                ), //##############End: This section is for the color of product

              ],
            ),//end Row inside the column

            //================== This section is for the product price ===================

            Container(
              alignment: Alignment.topLeft,
              child: Text(
                  "\$${cart_product_price}",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  ),
              ),
            )

          ],
        ),
        trailing: Column(
          children: <Widget>[

            IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: (){
                }
            ),

            Text("$cart_product_quantity"),

            IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: (){
                }
            )
          ],
        ),
      ),
    );
    
  }

  void addQuantityToCart(){
    cart_product_quantity = cart_product_quantity + 1;
  }

}

