import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product/product_card.dart';

class CategoryList extends StatelessWidget {
  final String? category;
  const CategoryList({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          category ?? "Beauty",
        ),
        backgroundColor: Colors.green.withOpacity(0.23),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductCard(
                title: "Chanel Coco Noir Eau De",
                description:
                    "Coco Noir by Chanel is an elegant and mysterious fragrance, featuring notes of grapefruit, rose, and sandalwood. Perfect for evening occasions.",
                price: 10,
                discountPercent: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
