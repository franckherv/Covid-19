import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:crud_app/GlobalDataSource/http_global_data_source.dart';
import 'package:crud_app/models/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DetaiScreen extends StatefulWidget {
  final Users user;
  DetaiScreen({
   @required this.user,
  });
  @override
  _DetaiScreenState createState() => _DetaiScreenState();
}

class _DetaiScreenState extends State<DetaiScreen> {
  HttpGlobalDataSource httpGlobalDataSource = HttpGlobalDataSource();
  Users userData;

  getSingleUserData() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.red
      ..maskColor = Colors.red
      ..userInteractions = false;
    await EasyLoading.show(status: "Chargement en cours ...");

    await httpGlobalDataSource
        .getSingleUser(userID: widget.user.id)
        .then((response) async {
      await EasyLoading.show();
      setState(() {
        userData = response;
      });
      await EasyLoading.dismiss();
    }).catchError((error) async {
      await EasyLoading.dismiss();
    });
  }

  @override
  void initState() {
    getSingleUserData();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
      ),
      body: userData != null
          ? Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: userData.picture,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )
              ],
            )
          : Container(),
    );
  }

  void statusCallback(EasyLoadingStatus status) {
    print('Test EasyLoading Status $status');
  }
}
