import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItems(
      {required this.id, required this.title, required this.color, Key? key})
      : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/catgories-meal-screen",
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(13),
        child: Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.6), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
