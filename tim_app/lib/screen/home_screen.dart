import 'package:flutter/material.dart';
import 'package:tim_app/http_data_source/http_globale_data.dart';
import 'package:tim_app/models/model_source.dart';

class HomeScrenn extends StatefulWidget {
  const HomeScrenn({Key key}) : super(key: key);

  @override
  _HomeScrennState createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

  List<Article> _articleList = [];

  getUserList() async {
    await httpGlobalDatasource.getUsers().then((response) async {
      setState(() {
        _articleList = response;
      });
    }).catchError((err) async {
      print("$err");
    });
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    print("${_articleList.length} valeur");
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _articleList.length,
          itemBuilder: (cxt, i) => ListTile(
                title: Text(_articleList[i].title),
              )),
    );
  }
}
