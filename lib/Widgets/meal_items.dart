import 'package:flutter/material.dart';
import 'package:third_prj/Screens/meal_details_screen.dart';
import '../Models/meal.dart';

class MealItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Enum complexity;
  final Enum affordability;
  final String id;

  const MealItems({
    required this.id,
    required this.complexity,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.affordability,
    Key? key,
  }) : super(key: key);

  String get complexText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";
      default:
        return "Unknown";
    }
  }

  String get affordText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Afforbable";

      case Affordability.Pricey:
        return "Pricey";

      case Affordability.Luxurious:
        return "Expensive";

      default:
        return "Unknown";
    }
  }

  void selectedMealPage(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMealPage(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(25),
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 0,
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: const BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
