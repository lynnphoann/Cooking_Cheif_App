import 'package:flutter/material.dart';
import 'package:third_prj/Screens/categories_screen.dart';
import 'package:third_prj/Screens/favourite_screen.dart';
import 'package:third_prj/main_drawer.dart';

class TabScreens extends StatefulWidget {
  const TabScreens({Key? key}) : super(key: key);

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  List<Map<String, Object>?> pages = [
    {"title": "Category", "page": CategoriesScreen},
    {"title": "Favourite", "page": FavouriteScreen}
  ];

  List Pages1 = [CategoriesScreen(), FavouriteScreen()];

  int selectedPage = 0;
  void selectPages(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPage]!["title"] as String),
      ),
      drawer: const Drawer(
        child: MainDrawer(),
        elevation: 6,
      ),
      body: SafeArea(child: Pages1[selectedPage]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 209, 206, 206),
        onTap: selectPages,
        currentIndex: selectedPage,
      ),
    );
  }
}
