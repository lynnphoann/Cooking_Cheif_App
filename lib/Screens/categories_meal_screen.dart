import 'package:flutter/material.dart';
import 'package:third_prj/Models/meal.dart';
import 'package:third_prj/Widgets/meal_items.dart';
import '../dummy_data.dart';

class Categories_meal_screen extends StatelessWidget {
  const Categories_meal_screen({Key? key}) : super(key: key);

  static const String nameRoute = "/catgories-meal-screen";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryTitle = routeArgs['title'];
    final String? categoryID = routeArgs['id'];
    final List<Meal> categoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryID);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: ((context, index) {
          return MealItems(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        }),
      ),
    );
  }
}
