import '../widgets/product_grid_tile.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final product = [
    {
      "name": "Maillot",
      "image": "images/shop/arsenal.jpg",
      "old_price": 6000,
      "price": 5290,
      "description":
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    },
    {
      "name": "Chaussure",
      "image": "images/shop/cho1.jpg",
      "old_price": 20000,
      "price": 18495,
      "description":
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    },
    {
      "name": "Sac",
      "image": "images/shop/sac1.jpg",
      "old_price": 11000,
      "price": 10000,
      "description":
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    },
    {
      "name": "Trophée",
      "image": "images/shop/tro1.jpg",
      "old_price": 70000,
      "price": 65000,
      "description":
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    },
    {
      "name": "Sac",
      "image": "images/shop/m1.jpg",
      "old_price": 14000,
      "price": 13000,
      "description":
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    },
    {
      "name": "ballon",
      "image": "images/shop/sac2.jpg",
      "old_price": 10000,
      "price": 9000,
      "description":
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 2),
        itemCount: product.length,
        itemBuilder: (cxt, i) => ProductGridTile(
              image: product[i]["image"],
              title: product[i]["name"],
              old: product[i]["old_price"],
              price: product[i]["price"],
              description: product[i]["description"],
            ));
  }
}
