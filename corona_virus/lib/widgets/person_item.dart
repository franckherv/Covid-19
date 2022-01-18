import 'package:corona_virus/providers/person_provider.dart';
import 'package:corona_virus/screens/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonItem extends StatelessWidget {
  final String id;
  final String firstName;
  final String lastName;
  final int age;
  final String number;
  final String city;
  PersonItem({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.number,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Spacer(),
                        Icon(Icons.person, color: Colors.grey, size: 80),
                        Spacer(),
                      ],
                    ),
                    Container(height: 80, width: 1, color: Colors.grey),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text("$firstName",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        FittedBox(
                          child: Text("$lastName",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          "N°: $number",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Age: $age ans",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Ville: $city",
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(BottomShetWidget.routeName, arguments: id);
                    },
                    icon: Icon(Icons.edit, color: Colors.grey),
                  ),
                ),
                Container(height: 1, width: 37, color: Colors.grey),
                Container(
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              content: Text(
                                  "Voulez-vous supprimez cette personne ?"),
                              title: Text("Confirmer"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: Text("Non")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                      Provider.of<Persons>(context,listen: false).deletePerson(id);
                                    },
                                    child: Text("Oui")),
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
