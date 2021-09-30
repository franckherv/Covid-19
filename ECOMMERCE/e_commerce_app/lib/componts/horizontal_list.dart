import 'package:e_commerce_app/models/cart_model.dart';
import 'package:flutter/material.dart';


class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Cart(title: "tricot", imageURL: "images/cart/1.jpg"),
            Cart(title: "robe", imageURL: "images/cart/2.webp"),
            Cart(title: "costume", imageURL: "images/cart/3.jpg"),
            Cart(title: "jordi", imageURL: "images/cart/4.jpg"),
            Cart(title: "pull", imageURL: "images/cart/5.png"),
            Cart(title: "goull", imageURL: "images/cart/6.jpg"),
            Cart(title: "Mat", imageURL: "images/cart/7.webp"),
          ],
        ));
  }
}



class Cart extends StatelessWidget {
  final String title;
  final String imageURL;

  Cart({this.title, this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(imageURL, width: 100, height: 80,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(title)),
          ),
        ),
      ),
    );
  }
}
