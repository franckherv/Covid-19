import '../screens/detail_product_screen.dart';
import 'package:flutter/material.dart';

class ProductGridTile extends StatelessWidget {
  final title;
  final image;
  final old;
  final price;
  final description;

  const ProductGridTile(
      {required this.title,
      required this.image,
      required this.old,
      required this.price,
      required this.description
      });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailScreen(
                  title: title,
                  imageUrl: image,
                  oldPrice: old,
                  newPrice: price,
                  description: description,
                )));
      },
      child: Card(
        child: Material(
          child: Stack(
            children: [
              GridTile(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                footer: Container(
                  height: 40,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "$title",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        "$old F",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 2,
                  child: FittedBox(
                    child: Container(
                      alignment: Alignment.center,
                     // width: 75,
                      //height: 20,
                      color: Colors.red,
                      child: Text(
                        "$price F",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
