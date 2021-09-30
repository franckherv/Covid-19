import 'package:flutter/material.dart';
import 'package:e_commerce_flutterapp/main.dart';


class ProductDetails extends StatefulWidget {

  String product_detail_name;
  String product_detail_picture;
  int product_detail_new_price;
  int product_detail_old_price;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture,
});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        elevation: 10.0,
        backgroundColor: Colors.red,
        title: InkWell(
            child: Text("Flashapp"),
            onTap: (){
              Navigator.of(context).pop();
              /*Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context){
                    return HomePage();
                  }
              )
              );*/
            },
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          //IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){})
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_picture),
                ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                        widget.product_detail_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                        ),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                                "\$${widget.product_detail_old_price}",
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough
                              ),
                            ),
                        ),
                        Expanded(
                          child: Text(
                              "\$${widget.product_detail_new_price}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ),

          ),

          //================== Start of the first Button ===========================

          Row(
            children: <Widget>[

              //=============== Start of the size button=================

              Expanded(
                  child: MaterialButton(
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text("Size") 
                          ),
                          Expanded(
                              child: Icon(Icons.arrow_drop_down)
                          )
                        ],
                      ),
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Size"),
                                content: Text("Choose the size"),
                                actions: <Widget>[
                                  MaterialButton(
                                      onPressed: (){
                                        Navigator.of(context).pop(context);
                                      },
                                    child: Text(
                                        "Close",
                                          style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ],
                              );
                            }
                        );
                      }
                  )
              ),

              //=============== End of the size button=================

    //=============== Start of the Color button=================

              Expanded(
                  child: MaterialButton(
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text("Color")
                          ),
                          Expanded(
                              child: Icon(Icons.arrow_drop_down)
                          )
                        ],
                      ),
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Colors"),
                                content: Text("Choose the color"),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: (){
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text(
                                      "Close",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ],
                              );
                            }
                        );
                      }
                  )
              ),

              //=============== End of the Color button=================

              //=============== Start of the Qty button=================

              Expanded(
                  child: MaterialButton(
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text("Qty")
                          ),
                          Expanded(
                              child: Icon(Icons.arrow_drop_down)
                          )
                        ],
                      ),
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Quantity"),
                                content: Text("Choose the quantity"),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: (){
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text(
                                      "Close",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ],
                              );
                            }
                        );
                      }
                  )
              )

              //=============== End of the Qty button=================

            ],
          ),
          //================== End of the first Button ===========================


          //**************************** Start of the Second Button *********************

          Row(
            children: <Widget>[

              //=============== Start of the buy button=================

              Expanded(
                  child: MaterialButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 0.2,
                      child: Text("Buy now"),
                    onPressed: (){
                        
                    },
                  )
              ),
              
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.red,
                  onPressed: (){

                  }
              ),

              IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: (){

                  }
              )

              //=============== End of the buy button=================

            ],
          ),
          //************************ End of the second Button ****************************
          Divider(color: Colors.red,),

          ListTile(
            title: Text("Product details"), 
            subtitle: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
              ),
          ),

          Divider(color: Colors.red,),

          //Start row 1
          Row(
            children: <Widget>[

              Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text(
                      "Product name",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
              ),

              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product_detail_name),
              ),

            ],
          ), //End row 1

          //Start row 2
          Row(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product brand",
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),

              ),

  //Remmber to create product brand

              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Brand X"),
              )

            ],
          ),//End row 2

          //Start row 3, add product condition
          Row(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product condition",
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),

              ),


              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("New"),
              )


            ],
          ),//End row 3

          Divider(color: Colors.red,),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Similar products"),
          ),

          //Similar products section
          Container(
            height: 340.0,
            child: SimilarProduct(),
        )

        ],
      ),
    );
  }
}


class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {


  var product_list = [

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
          return Similar_single_prod(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        }
    );
  }


}


class Similar_single_prod extends StatelessWidget {

  String product_name = "";
  String product_picture = "";
  int product_old_price = 0;
  int product_price = 0;

  Similar_single_prod({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: Text("hero 2 "), //product_name
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
