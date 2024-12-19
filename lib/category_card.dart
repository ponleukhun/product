import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String? category;
  final void Function()? onPressed;
  const CategoryCard({super.key, this.category, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          category ?? "Beauty",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
