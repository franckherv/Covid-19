import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  List<String> _beneficiaire = [
    'CIE',
    'SODECI',
    'Loyer',
  ];
  var _selectedbeneficiaire;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DropdownButton(
            hint: Text('Beneficiare'),
            value: _selectedbeneficiaire,
            onChanged: (Value) {
              setState(() {
                _selectedbeneficiaire = Value;
              });
            },
            items: _beneficiaire.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
