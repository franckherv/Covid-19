import 'package:corona_virus/providers/person_provider.dart';
import 'package:corona_virus/providers/person_provider.dart';
import 'package:provider/provider.dart';

import '../models/person_model.dart';
import 'package:flutter/material.dart';

class BottomShetWidget extends StatefulWidget {
  static const routeName = "/edit_screen";
  @override
  _BottomShetWidgetState createState() => _BottomShetWidgetState();
}

class _BottomShetWidgetState extends State<BottomShetWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController _firstNameController = TextEditingController();
  // TextEditingController _lastNameController = TextEditingController();
  // TextEditingController _numberController = TextEditingController();
  // TextEditingController _cityController = TextEditingController();
  // TextEditingController _ageController = TextEditingController();

  final _lastnamefocus = FocusNode();
  final _numberfocus = FocusNode();
  final _cityfocus = FocusNode();
  final _agefocus = FocusNode();

  var _isInit = true;

  var _editPerson = Person(
    id: '',
    firstName: '',
    lastName: '',
    age: 0,
    city: '',
    number: '',
  );

  var _initialValues = {
    'firstName': '',
    'lastName': '',
    'age': '',
    'city': '',
    'number': '',
  };

  @override
  void dispose() {
    _lastnamefocus.dispose();
    _numberfocus.dispose();
    _cityfocus.dispose();
    _agefocus.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final personID = ModalRoute.of(context)!.settings.arguments as String?;

      if (personID != null) {
        _editPerson =
            Provider.of<Persons>(context, listen: false).findById(personID);

        _initialValues = {
          'firstName': _editPerson.firstName,
          'lastName': _editPerson.lastName,
          'age': _editPerson.age.toString(),
          'city': _editPerson.city,
          'number': _editPerson.number,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    var isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_editPerson.id != '') {
      Provider.of<Persons>(context, listen: false)
          .updatePerson(_editPerson.id, _editPerson);
    } else {
      Provider.of<Persons>(context, listen: false).addPerson(_editPerson);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvel personne atteinte"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              ListTile(
                title: TextFormField(
                  initialValue: _initialValues['firstName'],
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Ce champs ne doit pas être vide";
                    }
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_lastnamefocus);
                  },
                  onSaved: (value) {
                    _editPerson = Person(
                      id: _editPerson.id,
                      firstName: value.toString(),
                      lastName: _editPerson.lastName,
                      age: _editPerson.age,
                      city: _editPerson.city,
                      number: _editPerson.number,
                    );
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  //controller: _firstNameController,

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
                  initialValue: _initialValues['lastName'],

                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Ce champs ne doit pas être vide";
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  focusNode: _lastnamefocus,
                  //controller: _lastNameController,
                  cursorColor: Colors.black,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_agefocus);
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
                    _editPerson = Person(
                      id: _editPerson.id,
                      firstName: _editPerson.firstName,
                      lastName: value.toString(),
                      age: _editPerson.age,
                      city: _editPerson.city,
                      number: _editPerson.number,
                    );
                  },
                ),
              ),
              // AGE

              ListTile(
                title: TextFormField(
                  initialValue: _initialValues['age'],

                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Ce champs ne doit pas être vide";
                    }

                    if (int.parse(value) <= 2) {
                      return "Entrer une valeur valide";
                    }
                  },
                  onSaved: (value) {
                    _editPerson = Person(
                      id: _editPerson.id,
                      firstName: _editPerson.firstName,
                      lastName: _editPerson.lastName,
                      age: int.parse(value.toString()),
                      city: _editPerson.city,
                      number: _editPerson.number,
                    );
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_numberfocus);
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _agefocus,
                  // controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'age',
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
              // NUMBER

              ListTile(
                title: TextFormField(
                  initialValue: _initialValues['number'],

                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Ce champs ne doit pas être vide";
                    }
                  },
                  onSaved: (value) {
                    _editPerson = Person(
                      id: _editPerson.id,
                      firstName: _editPerson.firstName,
                      lastName: _editPerson.lastName,
                      age: _editPerson.age,
                      city: _editPerson.city,
                      number: value.toString(),
                    );
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _numberfocus,
                  // controller: _numberController,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_cityfocus);
                  },

                  decoration: InputDecoration(
                    labelText: 'Numéro',
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
              // CITY

              ListTile(
                title: TextFormField(
                  initialValue: _initialValues['city'],

                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Ce champs ne doit pas être vide";
                    }
                  },
                  onSaved: (value) {
                    _editPerson = Person(
                      id: _editPerson.id,
                      firstName: _editPerson.firstName,
                      lastName: _editPerson.lastName,
                      age: _editPerson.age,
                      city: value.toString(),
                      number: _editPerson.number,
                    );
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  focusNode: _cityfocus,
                  // controller: _cityController,

                  decoration: InputDecoration(
                    labelText: 'Ville',
                    labelStyle: TextStyle(color: Colors.black),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black),
                    ),
                  ),
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    _saveForm();
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
}
