import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: const Center(
              child: Text(
                'My Chief',
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 35,
                    color: Colors.pink,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          DrawerItem(
            title: "Meals",
            icon: Icons.restaurant_menu,
          ),
          const SizedBox(
            height: 5,
          ),
          DrawerItem(
            title: "Filters",
            icon: Icons.settings,
          )
        ],
      ),
    );
  }

  ListTile DrawerItem({required String title, required IconData icon}) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
      hoverColor: Colors.pink,
      onTap: () {},
    );
  }
}
