import 'package:flutter/material.dart';
import 'package:third_prj/Screens/meal_details_screen.dart';
import 'package:third_prj/Screens/tab_screen.dart';
import 'Screens/categories_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHOPEE',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            toolbarTextStyle:
                const TextTheme(titleLarge: TextStyle(fontFamily: 'Raleway'))
                    .bodyText2,
            titleTextStyle: const TextTheme(
              titleLarge: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ).headline6),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoCondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              caption: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const TabScreens(),
        Categories_meal_screen.nameRoute: (context) =>
            const Categories_meal_screen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
      },
    );
  }
}
