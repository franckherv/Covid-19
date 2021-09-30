import 'package:flutter/material.dart';

class CartProductWidget extends StatefulWidget {
  @override
  _CartProductWidgetState createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  var items = [
    {
      "name": "Maillot",
      "image": "images/shop/arsenal.jpg",
      "price": 5290,
      "size": "M",
      "color": "blanc",
      "quantity": 1
    },
    {
      "name": "Chaussure",
      "image": "images/shop/cho1.jpg",
      "price": 18495,
      "size": "40",
      "color": "noir",
      "quantity": 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => SingleCartProductItem(
        productName: items[index]["name"],
        productImage: items[index]["image"],
        productPrice: items[index]["price"],
        productSize: items[index]["size"],
        productColor: items[index]["color"],
        productQty: items[index]["quantity"],
      ),
    );
  }
}

class SingleCartProductItem extends StatelessWidget {
  final productName;
  final productImage;
  final productPrice;
  final productSize;
  final productColor;
  final productQty;
  SingleCartProductItem({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productSize,
    required this.productColor,
    required this.productQty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        child: ListTile(
            leading: Image.asset(
              productImage,
              height: 80,
              width: 80,
            ),
            title: Text(productName),
            subtitle: Column(
              children: [
              
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Tle"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("$productSize",
                          style: TextStyle(color: Colors.red)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      child: Text("Colr"),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "$productColor",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )),
                  ],
                ),
                Container(
                  
                  alignment: Alignment.topLeft,
                  child: Text("$productPrice F",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Color(0xff254A60))),
                ),
              ],
            ),
            trailing: Column(
              
              children: [
                   Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_up))),
                   SizedBox(height: 20),
                   Expanded(child: Text("$productQty")),
                  Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down))),
              ],
            ),
            
            ),
      ),
    );
  }
}
