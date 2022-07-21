import 'package:flutter/material.dart';
import 'package:third_prj/dummy_data.dart';
import '../Models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = "/meal-details-screen";
  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mealID = ModalRoute.of(context)!.settings.arguments as String;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover)),
            titleText("Ingredients"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 244, 244),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Theme.of(context).colorScheme.secondary,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              selectedMeal.ingredients[index],
                              style: TextStyle(fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                  physics: const BouncingScrollPhysics(
                      parent: BouncingScrollPhysics()),
                ),
              ),
            ),
            titleText("Steps"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              "#${index + 1}",
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
                            ),
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleText(String inputText) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          inputText,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
