import 'package:api_connecting/models/user.dart';
import 'package:api_connecting/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Users>> user;

  //late APIResponse<List<NoteForListing>> _apiResponse;

  @override
  void initState() {
    super.initState();
    user = ApiService().getuserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("USERS DATA"),
        ),
        body: FutureBuilder(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(snapshot.data.toString())
                );
              } else if (snapshot.hasError) {
                Text('${snapshot.hasError}');
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
