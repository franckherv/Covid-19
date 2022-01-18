//import 'package:billsoft/widgets/details_widget_enAttente.dart.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tim_app_build/controllers/decaissementController.dart';
import 'package:tim_app_build/model/decaissement.dart';
import 'package:tim_app_build/provider/decaissement_providers.dart';
import 'package:tim_app_build/services/decaissement_service.dart';
import 'package:tim_app_build/widgets/details_widget_valide.dart';

class SearchScreenValide extends StatefulWidget {
  static const routeName = '/SearchScreen-valide';
  @override
  _SearchScreenValideState createState() => _SearchScreenValideState();
}

class _SearchScreenValideState extends State<SearchScreenValide> {
  bool isSearchClicked = true;

  final TextEditingController _filter = new TextEditingController();
  Icon _searchIcon = Icon(
    Icons.search,
  );
  final decaissementController = Get.put(DecaissementController());

  List<Decaissement> tmpList = [];
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
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
      return <Widget>[createSilverAppBar()];
    }, body: Consumer<Decaissements>(builder: (cxt, decaissementData, _) {
      print(decaissementData.decs.toString());
      return Center(
          child: FutureBuilder<List<Decaissement>>(
              future: fetchDecaissement(3),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: tmpList.length > 0
                          ? tmpList.length
                          : decaissementController.decaissements!.length,
                      itemBuilder: (BuildContext context, index) {
                        Decaissement decaissement = tmpList.length > 0
                            ? tmpList[index]
                            : snapshot.data![index];
                        return WelcomePageWidgetValide(
                          decaissement.idDecaissement,
                          decaissement.idMtf,
                          decaissement.idBnf,
                          decaissement.numeroDecaissement,
                          decaissement.numeroPiece,
                          decaissement.montant,
                          decaissement.beneficiaire,
                          decaissement.numeroBeneficiaire,
                          decaissement.commentaire,
                          decaissement.dateRealisation,
                          decaissement.datecreation,
                          decaissement.idusrcreation,
                          decaissement.idusrcreationStatut,
                          decaissement.commentaireStatut,
                          decaissement.datecreationStatut,
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              }));
    })));
  }

  SliverAppBar createSilverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.blue[900],
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
                      searchInvoiceItem(searchKeyword: value);

                      /*Provider.of<Decaissements>(context, listen: false)
                          .changeSearchString(value);*/
                    },
                    controller: _filter,
                    keyboardType: TextInputType.text,
                    placeholder: "Recherche N°decaissement",
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
              : Text(""),
          background: Image.asset(
            "images/logobillsoft.png",
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

  searchInvoiceItem({required String searchKeyword}) {
    setState(() {
      tmpList = decaissementController.decaissements!
          .where((Decaissement decaissement) => decaissement.numeroDecaissement!
              .toLowerCase()
              .contains(searchKeyword.toLowerCase()))
          .toList();
    });
  }
}
