import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Cart(title: "Maillot", imageURL: "images/categorie/maillot.jpg"),
            Cart(title: "Chaussette", imageURL:"images/categorie/chaussette.jpg"),
            Cart(title: "Trophé", imageURL: "images/categorie/trophée.jpg"),
            Cart(title: "Sac", imageURL:"images/categorie/sac.jpg"),
            Cart(title: "Chaussure", imageURL:"images/categorie/cho.jpg"),
            Cart(title: "Ballon", imageURL:"images/categorie/ballon.jpg"),
            Cart(title: "filet", imageURL:"images/categorie/fillet.jpg"),
          ],
        ));
  }
}

class Cart extends StatelessWidget {
  final String title;
  final String imageURL;

  Cart({required this.title,required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80,
          child: ListTile(
            title: Image.asset(imageURL, width: 70, height: 80,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(title)),
          ),
        ),
      ),
    );
  }
}

