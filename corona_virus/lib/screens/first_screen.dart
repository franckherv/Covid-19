import 'package:corona_virus/screens/edit_screen.dart';
import 'package:corona_virus/widgets/person_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corona_virus/providers/person_provider.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isSearchClicked = true;
  final TextEditingController _filter = new TextEditingController();
  Icon _searchIcon = Icon(
    Icons.search,
  );

  late String _searchText;

  @override
  void initState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final personData = Provider.of<EnCaissement>(context).items;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => BottomShetWidget()));
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[createSilverAppBar()];
        },
        body: Consumer<Persons>(builder: (cxt, personData, _) {
          print(personData.pers.toString());
          return ListView.builder(
              itemCount: personData.pers.length,
              itemBuilder: (context, index) {
                return PersonItem(
                  id: personData.pers[index].id,
                  firstName: personData.pers[index].firstName,
                  lastName: personData.pers[index].lastName,
                  age: personData.pers[index].age,
                  number: personData.pers[index].number,
                  city: personData.pers[index].city,
                );
              });
        }),
      ),
    );
  }

  SliverAppBar createSilverAppBar() {
    return SliverAppBar(
      actions: <Widget>[
        RawMaterialButton(
          elevation: 0.0,
          child: _searchIcon,
          onPressed: () {
            _searchPressed();
          },
          constraints: BoxConstraints.tightFor(
            width: 56,
            height: 56,
          ),
          shape: CircleBorder(),
        ),
      ],
      expandedHeight: 190,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(bottom: 15),
          centerTitle: true,
          title: isSearchClicked
              ? Container(
                  padding: EdgeInsets.only(bottom: 2),
                  constraints: BoxConstraints(minHeight: 40, maxHeight: 40),
                  width: 220,
                  child: CupertinoTextField(
                    onChanged: (value) {
                      Provider.of<Persons>(context, listen: false)
                          .changeSearchString(value);
                    },
                    controller: _filter,
                    keyboardType: TextInputType.text,
                    placeholder: "Search..",
                    placeholderStyle: TextStyle(
                      color: Color(0xffC4C6CC),
                      fontSize: 12.0,
                      fontFamily: 'Cairo',
                    ),
                    prefix: Padding(
                      padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                  ),
                )
              : Text(
                  "Stop au Corona_virus",
                  style: TextStyle(fontSize: 25),
                ),
          background: Image.asset(
            "images/heath.jpg",
            fit: BoxFit.cover,
          )),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(
          Icons.close,
        );
        isSearchClicked = true;
      } else {
        this._searchIcon = Icon(
          Icons.search,
        );
        isSearchClicked = false;
        _filter.clear();
      }
    });
  }
}
