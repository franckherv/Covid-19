import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yvo_resp_api_learning/http_data_source/Http_Global_Data_source.dart';
import 'package:yvo_resp_api_learning/models/user_model.dart';
import 'package:yvo_resp_api_learning/screens/add_user.dart';
import 'package:yvo_resp_api_learning/widgets/user_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String loadingMessage = "Veuillez patienter s'il vous plaît ...";


  List<UserModel> _userList = [];

  getUserList() async {
    await EasyLoading.show(
        status: "Chargement en cours ...",
        indicator: Container(color: Colors.redAccent));

    await httpGlobalDatasource.getUsers().then((response) async {
      setState(() {
        _userList = response;
      });
      await EasyLoading.dismiss();
    }).catchError((err) async {
      
      await EasyLoading.dismiss();
    });
  }

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("note ======${_userList.length}=======");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text("List de personnes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddUserEdit()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
              itemCount: _userList.length,
              itemBuilder: (cxt, index) => UserItem(user: _userList[index])),
    );
  }
}
