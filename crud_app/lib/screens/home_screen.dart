import 'package:crud_app/screens/post_new_user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../GlobalDataSource/http_global_data_source.dart';
import 'package:crud_app/widgets/user_item.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HttpGlobalDataSource httpGlobalDataSource = HttpGlobalDataSource();

  List<Users> _userList = [];

  getUserList() async {
    await EasyLoading.show();

    await httpGlobalDataSource.getUserValue().then((response) async {
      setState(() {
        _userList = response;
      });
      await EasyLoading.dismiss();
    }).catchError((onError) async {
      print(onError);
      await EasyLoading.dismiss();
    });
  }

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  Widget build(BuildContext context) {
    print(_userList.length);
    return Scaffold(
        appBar: AppBar(
          title: Text("GET API DATA"),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 7, right: 8),
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => PostNewUser()));
                },
              ),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: _userList.length,
            itemBuilder: (cxt, i) => UserItem(item: _userList[i])));
  }
}
