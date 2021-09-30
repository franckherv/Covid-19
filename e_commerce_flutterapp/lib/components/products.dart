import 'package:e_commerce_flutterapp/pages/product_details.dart';
import 'package:flutter/material.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var product_list = [
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
      "old_price":120,
      "price":85,
    },
    {
      "name":"Red dress",
      "picture":"images/products/dress1.jpeg",
      "old_price":100,
      "price":50,
    },
    {
      "name":"Red dress",
      "picture":"images/products/hills1.jpeg",
      "old_price":100,
      "price":50,
    },
    {
    "name":"Red dress",
    "picture":"images/products/skt1.jpeg",
    "old_price":100,
    "price":50,
    },
    {
    "name":"Red dress",
    "picture":"images/products/skt2.jpeg",
    "old_price":100,
    "price":50,
    },
    {
    "name":"Red dress",
    "picture":"images/products/dress2.jpeg",
    "old_price":100,
    "price":50,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
        itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Single_prod(
                product_name: product_list[index]['name'],
                product_picture: product_list[index]['picture'],
                product_old_price: product_list[index]['old_price'],
                product_price: product_list[index]['price'],
              ),
            );
          }
        );
  }
}

class Single_prod extends StatelessWidget {

   String product_name = "";
   String product_picture = "";
   int product_old_price = 0;
   int product_price = 0;

  Single_prod({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: Text("hero 1 "), //product_name
          child: Material(
            child: InkWell(
              onTap: (){
                //aller a la page detail lors d'un clic sur un produit
                return Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context){
                          //passer des parametres de navigation a la page de detail
                          return ProductDetails(
                              product_detail_name: product_name,
                              product_detail_new_price: product_price,
                              product_detail_old_price: product_old_price,
                              product_detail_picture: product_picture
                          );
                        }
                    )
                );
              },
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                              product_name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                              ),
                            ),
                        ),
                        
                        Text(
                          "\$${product_price}",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    /*child: ListTile(
                      leading: Text(
                        product_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      title: Text(
                          "\$$product_price",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w800
                          ),
                      ),
                      subtitle: Text(
                        "\$$product_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                    ),*/
                  ),
                  child: Image.asset(
                      product_picture,
                      fit: BoxFit.cover,
                  )
              ),
            ),
          )
      ),
    );
  }
}

