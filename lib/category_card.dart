import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String? category;
  const CategoryCard({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        category ?? "Beauty",
        textAlign: TextAlign.center,
      ),
    );
  }
}
