import 'package:crud_app/models/user_model.dart';
import 'package:crud_app/widgets/user_item.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<Users> items;

  UserList({ this.items});
  @override
  Widget build(BuildContext context) {
    print(items.length);
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return UserItem(item: items[index]);
      },
    );
  }
}
