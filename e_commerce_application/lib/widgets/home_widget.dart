import 'package:e_commerce_application/widgets/horizontal_widget.dart';

import '../widgets/product_widget.dart';
import '../widgets/category_item.dart';
import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Widget imageCaroussel = Container(
    height: 150,
    color: Colors.black54,
    child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/ballon3.jpeg"),
          AssetImage("images/bc1.webp"),
          AssetImage("images/ci2.webp"),
          AssetImage("images/medaille3.jpeg"),
          AssetImage("images/shoes4.webp"),
        ],
        autoplay: false,
        dotSize: 4,
        indicatorBgPadding: 10,
        dotBgColor: Colors.transparent),
  );
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // List de caroussel
       // imageCaroussel,
        Text(
          "Cathégories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        HorizontalList(),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Nouveaux produits",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: ProductWidget(),
        )
      ],
    );
  }
}
