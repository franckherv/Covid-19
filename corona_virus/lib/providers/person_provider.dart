import 'dart:collection';

import '../models/person_model.dart';
import 'package:flutter/foundation.dart';

class Persons with ChangeNotifier {
  List<Person> _items = [
    Person(
        id: '1',
        firstName: 'Assandé',
        lastName: 'Jean Pierre',
        age: 23,
        city: 'Abidjan',
        number: '0748675690'),
    Person(
        id: '2',
        firstName: 'Ebrotié',
        lastName: 'Serge',
        age: 35,
        city: 'Abidjan',
        number: '0709674523'),
    Person(
        id: '3',
        firstName: 'Kouadio',
        lastName: 'Olivier Boris',
        age: 57,
        city: 'Bouaké',
        number: '0143675690'),
    Person(
        id: '4',
        firstName: 'Kouamé',
        lastName: 'Marie Lyn',
        age: 43,
        city: 'Adzopé',
        number: '0786534231'),
    Person(
        id: '5',
        firstName: 'Koné',
        lastName: 'Awa Fatim',
        age: 23,
        city: 'Bouaké',
        number: '0707675680'),
  ];
  List<Person> get items {
    return [..._items];
  }

  Person findById(String id) {
    return _items.firstWhere((per) => per.id == id);
  }


    String _searchString = "";

  UnmodifiableListView<Person> get pers => _searchString.isEmpty
      ? UnmodifiableListView(_items)
      : UnmodifiableListView(
          _items.where((per) => per.firstName.toLowerCase().contains(_searchString)));

  void changeSearchString(String searchString) {
    _searchString = searchString;
    print(_searchString);
    notifyListeners();
  }


  void addPerson(Person person) {
    final newPerson = Person(
        firstName: person.firstName,
        lastName: person.lastName,
        age: person.age,
        city: person.city,
        number: person.number,
        id: DateTime.now().toString());
    _items.add(newPerson);
    notifyListeners();
  }

  void deletePerson(String id) {
    _items.removeWhere((pers) => pers.id == id);
    notifyListeners();
  }

  void updatePerson(String id, Person newPerson) {
    final personIndex = _items.indexWhere((elem) => elem.id == id);

    if(personIndex >= 0){
    _items[personIndex] = newPerson;
    notifyListeners();
    }
  }
}
