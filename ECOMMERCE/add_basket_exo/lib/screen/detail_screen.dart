import 'package:add_basket_exo/providers/recipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = "/route";
  @override
  Widget build(BuildContext context) {
    final passRecipeID = ModalRoute.of(context).settings.arguments as String;
    final passRecipe = Provider.of<RecipeProviders>(context).getRecipes;

    final queryResult =
        passRecipe.firstWhere((element) => element.id == passRecipeID);
    return Scaffold(
      appBar: AppBar(
        title: Text(queryResult.name),
      ),
      body: ListView(
        children: [
          Image.network(queryResult.imageURL),
          Text(queryResult.name),
          Text(queryResult.ingredients.first),
        ],
      ),
    );
  }
}
