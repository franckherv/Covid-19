import 'package:e_commerce_app/pages/product_detail.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product = [
    {
      "name": "costume dame",
      "image": "images/costume.jpg",
      "old_price": 100,
      "price": 85,
    },
    {
      "name": "costume dame",
      "image": "images/costumehome.jpg",
      "old_price": 120,
      "price": 95,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount: product.length,
      itemBuilder: (cxt, index) {
        return SingleProducts(
          prodname: product[index]["name"],
          prodpicture: product[index]["image"],
          prodoldprice: product[index]["old_price"],
          prodprice: product[index]["price"],
        );
      },
    );
  }
}

class SingleProducts extends StatelessWidget {
  final prodname;
  final prodpicture;
  final prodoldprice;
  final prodprice;

  const SingleProducts(
      {this.prodname, this.prodpicture, this.prodoldprice, this.prodprice});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
      tag: prodname,
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (cxt) => PageDetails(
                proname: prodname,
                proolprice: prodoldprice,
                proprice: prodprice,
                proImage: prodpicture,
              ))),
          child: GridTile(
            child: Image.asset(prodpicture),
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(
                  prodname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Text("\$$prodprice",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
                subtitle: Text("\$$prodoldprice",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        decoration: TextDecoration.lineThrough)),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
