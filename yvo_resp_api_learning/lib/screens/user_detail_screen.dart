import 'package:flutter/material.dart';
import 'package:yvo_resp_api_learning/http_data_source/Http_Global_Data_source.dart';
import 'package:yvo_resp_api_learning/models/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yvo_resp_api_learning/widgets/custum_animation.dart';

class UserDetailScreen extends StatefulWidget {
  final UserModel user;

  UserDetailScreen({
    @required this.user,
  });

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

  UserModel userData;

  getSingleUserList() async {
     EasyLoading.instance
                  ..displayDuration = const Duration(milliseconds: 2000)
                  ..backgroundColor = Colors.white
                  ..indicatorColor = Colors.red
                  ..maskColor = Colors.red
                  ..userInteractions = false;
    await EasyLoading.show(status: "Chargement en cours ...");
    await httpGlobalDatasource
        .getSingleUser(userId: widget.user.id)
        .then((response) async {
        
      setState(() {
        userData = response;
      });
      await EasyLoading.dismiss();
    }).catchError((err) async {
       await EasyLoading.dismiss();
    });
  }



   @override
  void initState() {
     getSingleUserList();
    super.initState();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    EasyLoading.removeCallback(statusCallback);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    //print(userData.email);
    final hauteur = MediaQuery.of(context).size.height;
    final largeur = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu, color: Colors.brown),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Welcome",
          style: TextStyle(
              fontFamily: "Italianno", fontSize: 35, color: Colors.brown),
        ),
      ),
      body: userData != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Info perso",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: Icon(Icons.person,
                                size: 130, color: Colors.white),
                            decoration: BoxDecoration(
                                color: Colors.brown, shape: BoxShape.circle),
                          )
                        ],
                      )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  height: 25,
                                  color: Colors.brown,
                                  child:
                                      Icon(Icons.download, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Text("Télechargez-en une")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  height: 25,
                                  color: Colors.brown,
                                  child: Icon(Icons.close, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Text("Supprimer la photo")
                              ],
                            ),
                          ),
                        ],
                      )),
                    ],
                  )),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Prenom",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              alignment: Alignment.centerLeft,
                              color: Colors.grey,
                              width: largeur * 0.4,
                              height: hauteur * 0.07,
                              child: FittedBox(
                                  child: Text(
                                "${userData.firstName}",
                                style: TextStyle(fontSize: 25),
                              )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(""),
                            Container(
                              padding: EdgeInsets.all(7),
                              alignment: Alignment.centerLeft,
                              color: Colors.white,
                              width: largeur * 0.4,
                              height: hauteur * 0.07,
                              child: FittedBox(
                                  child: Text(
                                " Genre ******",
                                style: TextStyle(fontSize: 25),
                              )),
                            ),
                          ],
                        ),

                        // 2nd column

                        Column(
                          children: [
                            Text(
                              "Nom",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              alignment: Alignment.centerLeft,
                              color: Colors.grey,
                              width: largeur * 0.4,
                              height: hauteur * 0.07,
                              child: FittedBox(
                                  child: Text(
                                "${userData.lastName}",
                                style: TextStyle(fontSize: 25),
                              )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pseudo",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              alignment: Alignment.centerLeft,
                              color: Colors.grey,
                              width: largeur * 0.4,
                              height: hauteur * 0.07,
                              child: FittedBox(
                                  child: Text(
                                "GFRD",
                                style: TextStyle(fontSize: 25),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Email"), Container()],
                  ))
                ],
              ),
            )
          : Container(),
    ));
  }

    void statusCallback(EasyLoadingStatus status) {
    print('Test EasyLoading Status $status');
  }

}
