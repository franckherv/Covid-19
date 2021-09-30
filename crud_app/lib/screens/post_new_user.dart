import 'package:crud_app/GlobalDataSource/http_global_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PostNewUser extends StatefulWidget {
  @override
  _PostNewUserState createState() => _PostNewUserState();
}

class _PostNewUserState extends State<PostNewUser> {
  HttpGlobalDataSource httpGlobalDataSource = HttpGlobalDataSource();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 150.0,
            ),
            // input field for email

            // input field for password
            TextFormField(
              controller: _firstNameController,

              decoration: InputDecoration(labelText: 'first name'),
              // obscureText: true,
              // validator: (value) =>
              //     value.isEmpty ? 'Password cannot be blank' : null,
              // onSaved: (value) => _password = value,
            ),

            TextFormField(
              controller: _lastNameController,

              decoration: InputDecoration(labelText: 'last name'),
              // obscureText: true,
              // validator: (value) =>
              //     value.isEmpty ? 'Password cannot be blank' : null,
              // onSaved: (value) => _password = value,
            ),
            TextFormField(
              controller: _titleController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'email'),
              // validator: (value) =>
              //     value.isEmpty ? 'Email cannot be blank' : null,
              // onSaved: (value) => _email = value,
            ),
            ElevatedButton(
              child: Text(
                'Add new user',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: addNewUser,
            ),
          ],
        ),
      ),
    );
  }

  addNewUser() async {
    await EasyLoading.show(status: "Envoi en cours");
    await httpGlobalDataSource
        .sendUser(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _titleController.text,
    )
        .then((value) async {
      Navigator.of(context).pop();
      print(value);
      await EasyLoading.dismiss();
    }).catchError((err) async {
      print(err);
      await EasyLoading.dismiss();
    });
  }
}
