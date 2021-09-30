import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yvo_resp_api_learning/http_data_source/Http_Global_Data_source.dart';
import 'package:yvo_resp_api_learning/models/user_model.dart';

class AddUserEdit extends StatefulWidget {
  @override
  _AddUserEditState createState() => _AddUserEditState();
}

class _AddUserEditState extends State<AddUserEdit> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

   TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

   UserModel userData;

   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              ListTile(
                title: TextFormField(
                  
                  onFieldSubmitted: (_) {
                    
                  },
                  onSaved: (value) {
                    
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    labelStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              // last_name textfield
              ListTile(
                title: TextFormField(
                  

                  
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  controller: _lastNameController,
                  cursorColor: Colors.black,
                  onFieldSubmitted: (_) {
                    
                  },

                  decoration: InputDecoration(
                    labelText: 'Prenom',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black),
                    ),
                  ),
                  onSaved: (value) {
                  
                  },
                ),
              ),
              // AGE

              ListTile(
                title: TextFormField(
                  controller: _emailController,
                  onFieldSubmitted: (_) {
                    
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                
                  // controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              

             

              Padding(
                padding: const EdgeInsets.all(12),
                child: MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    addNewUser();
                  },
                  child: Text("Ajouter",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              )
            ],
          ),
        ),
      ),
    );
    
  }


  addNewUser() async {
    
    await EasyLoading.show(status: "Chargement en cours ...");
    await httpGlobalDatasource
        .addNewUser(firstName: _firstNameController.text, lastName: _lastNameController.text, email: _emailController.text )
        .then((response) async {
        
      setState(() {
        //userData = response;
      });
      await EasyLoading.dismiss();
    }).catchError((err) async {
       await EasyLoading.dismiss();
    });
  }

}
