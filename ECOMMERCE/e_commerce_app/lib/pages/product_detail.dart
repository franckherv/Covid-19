import 'package:flutter/material.dart';

class PageDetails extends StatefulWidget {
  final proname;
  final proolprice;
  final proprice;
  final proImage;

  const PageDetails(
      {this.proname, this.proolprice, this.proprice, this.proImage});

  @override
  _PageDetailsState createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("FlashApp"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            color: Colors.white,
            child: GridTile(
              child: Container(
                  color: Colors.white, child: Image.asset(widget.proImage)),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.proname),
                  title: Row(
                    children: [
                      Expanded(
                          child: Text("\$${widget.proolprice}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey))),
                      Expanded(
                          child: Text("\$${widget.proprice}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //    ========== MaterialButton ================
          Row(children: [
            Expanded(
              child: MaterialButton(
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (cxt) {
                        return AlertDialog(
                          title: Text("Choose size"),
                          content: Text("content"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: [
                    Expanded(child: Text("Size")),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
            ),
            //       ==== Button two ========
            Expanded(
              child: MaterialButton(
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (cxt) {
                        return AlertDialog(
                          title: Text("Choose Color"),
                          content: Text("content"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: [
                    Expanded(child: Text("Color")),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
            ),

            Expanded(
              child: MaterialButton(
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (cxt) {
                        return AlertDialog(
                          title: Text("Choose Quantity"),
                          content: Text("content"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: [
                    Expanded(child: Text("Qty")),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
            ),
          ]),

          //       ==== Button two ========

          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  onPressed: () {},
                  child: Text("Buy now"),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {}),
            ],
          ),
          Divider(),
          ListTile(
            title: Text("Products detail"),
            subtitle: Text(
                "has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages."),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Products name"),
              ),
               Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.proname),
              ),
            ],
          ),
                    Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Products brand"),
              ),
                Padding(
                padding: EdgeInsets.all(5),
                child: Text("Brand X"),
              ),
            ],
          ),
                    Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Products condition"),
              ),
                Padding(
                padding: EdgeInsets.all(5),
                child: Text("NEW"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
