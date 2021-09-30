import 'package:add_basket_exo/providers/recipe_provider.dart';
import 'package:add_basket_exo/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTrue = true;
  var favorite = ["Mes favoris", "Mes Produits"];
  @override
  Widget build(BuildContext context) {
    final recipe = Provider.of<RecipeProviders>(context).getRecipes;
    return Scaffold(
      appBar:
          AppBar(leading: Icon(Icons.home), title: Text("Accueil"), actions: [
        PopupMenuButton(
          onSelected: (data) {
            setState(() {
              if (data == "Mes Produits") {
                isTrue = true;
              } else {
                isTrue = false;
              }
            });
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (context) {
            return favorite
                .map((data) => PopupMenuItem(
                      value: data,
                      child: Text(data),
                    ))
                .toList();
          },
        ),
      ]),
      body: (isTrue) ? GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              crossAxisCount: 2),
          itemCount: recipe.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DetailScreen.routeName,
                      arguments: recipe[index].id);
                },
                child: GridTile(
                  child: Image.network(recipe[index].imageURL),
                  footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Colors.red),
                    ),
                    title: Text(recipe[index].name),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart, color: Colors.white)),
                  ),
                ),
              ),
            );
          }): Text("Favoris"),
    );
  }
}
