import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final title;
  final imageUrl;
  final oldPrice;
  final newPrice;
  final description;

  DetailScreen({this.title, this.imageUrl, this.oldPrice, this.newPrice, this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xff254A60),
        title: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(title)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(imageUrl),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    "$title",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  title: Text(
                    "$oldPrice Fcfa",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  trailing: Text(
                    "$newPrice Fcfa",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          // ---------------------First button------------------------------
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Taille"),
                            content:
                                Text("Choississez la taille qui vous convient"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Fermer"),
                              )
                            ],
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Expanded(child: Text("Taille")),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              // ====== Color
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Coulour"),
                            content: Text(
                                "Choississez la couleur qui vous convient"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Fermer"),
                              )
                            ],
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Expanded(child: Text("Couleur")),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),

              //====== Quantité
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Quantité"),
                            content: Text(
                                "Choississez la quatité qui vous convient"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Fermer"),
                              )
                            ],
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Expanded(child: Text("Qty")),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          //-----------------------second button---------------------------

          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  color: Color(0xff254A60),
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Acheter",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_shopping_cart, color: Colors.red)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border, color: Colors.red)),
            ],
          ),
          Divider(),
          ListTile(
            title: Text(
              "Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text("$description"),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Nom",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  title.toUpperCase(),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Marque",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("X"),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("NOUVEAU"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
