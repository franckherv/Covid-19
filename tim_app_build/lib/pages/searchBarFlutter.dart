//import 'package:flutter/material.dart';

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   late SearchBar searchBar;

//   @override
//   AppBar buildAppBar(BuildContext context) {
//     return new AppBar(
//         title: new Text('My Home Page'),
//         actions: [searchBar.getSearchAction(context)]);
//   }

//   _SearchState() {
//     searchBar = new SearchBar(
//         inBar: false,
//         setState: setState,
//         onSubmitted: print,
//         buildDefaultAppBar: buildAppBar);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(appBar: searchBar.build(context));
//   }
//}

// class _MyHomePageState extends State<MyHomePage> {
//  late SearchBar searchBar;
  
//   AppBar buildAppBar(BuildContext context) {
//     return new AppBar(
//       title: new Text('My Home Page'),
//       actions: [searchBar.getSearchAction(context)]
//     );
//   }  
  
//   _MyHomePageState() {

//     searchBar = new SearchBar(
//       inBar: false,
//       setState: setState,
//       onSubmitted: print,
//       buildDefaultAppBar: buildAppBar
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: searchBar.build(context)
//     );
//   }
// }