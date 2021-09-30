import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:yvo_resp_api_learning/models/user_model.dart';
import 'package:yvo_resp_api_learning/screens/user_detail_screen.dart';

class UserItem extends StatelessWidget {
  final UserModel user;
  UserItem({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserDetailScreen(user: user,) ));
        },
        leading: CircleAvatar(
        child: CachedNetworkImage(
        imageUrl: this.user.picture,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     )),
        title: Text("${this.user.firstName}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward_ios));
  }
}
