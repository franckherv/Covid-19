import 'package:e_commerce_application/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _items = [
    Category(id: "p1", categoryName: "Image1", categoryImage: "images/categorie/1.jpg"),
    Category(id: "p2", categoryName: "Image2", categoryImage: "images/categorie/2.webp"),
    Category(id: "p3", categoryName: "Image3", categoryImage: "images/categorie/cho1.jpg"),
    Category(id: "p4", categoryName: "Image4", categoryImage: "images/categorie/pat1.jpg"),
    Category(id: "p5", categoryName: "Image5", categoryImage: "images/categorie/5.png"),
    Category(id: "p6", categoryName: "Image6", categoryImage: "images/categorie/6.jpg"),
    Category(id: "p2", categoryName: "Image2", categoryImage: "images/categorie/7.webp"),
  ];

  List<Category> get items {
    return [..._items];
  }
}
