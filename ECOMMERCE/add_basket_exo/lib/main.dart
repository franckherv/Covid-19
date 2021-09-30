import 'package:add_basket_exo/providers/recipe_provider.dart';
import 'package:add_basket_exo/screen/detail_screen.dart';
import 'package:add_basket_exo/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipeProviders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: {
          '/': (cxt) => HomeScreen(),
          DetailScreen.routeName: (cxt) => DetailScreen(),
        },
      ),
    );
  }
}
