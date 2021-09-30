import 'package:api_connecting/models/cat_model.dart';
import 'package:api_connecting/services/cat_service.dart';
import 'package:flutter/material.dart';

class CatScrenn extends StatefulWidget {
  @override
  _CatScrennState createState() => _CatScrennState();
}

class _CatScrennState extends State<CatScrenn> {
  late Cat cat;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      cat = await CatService().fetchCat();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cat Items"),
      ),
      body: FutureBuilder<Cat>(
          future: CatService().fetchCat(),
          builder: (context, snapshot) {
            final cat = snapshot.data;
            if (snapshot.hasData) {
              return Column(
                children: [
                  //Image.network(cat!.url),
                  Text(cat!.id.toString()),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
