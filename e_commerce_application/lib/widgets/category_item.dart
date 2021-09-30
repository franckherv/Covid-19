import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String catId;
  final String catTitle;
  final String catImage;

   CategoryItem({
    required this.catId,
    required this.catTitle,
    required this.catImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(2),
      child: Container(
        width: 100,
        child: ListTile(
          onTap: (){},
          subtitle: Text(catTitle),
          title: Image.asset(catImage)
        ),
      ),
    );
  }
}
