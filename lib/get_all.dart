import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product/category_card.dart';
import 'package:product/product_card.dart';
import 'package:product/research_bar.dart';

class GetAllProduct extends StatefulWidget {
  const GetAllProduct({super.key});

  @override
  State<GetAllProduct> createState() => _GetAllProductState();
}

class _GetAllProductState extends State<GetAllProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: const Column(
            children: [
              ResearchBar(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CategoryCard(),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryCard(
                    category: "Smart Phone",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryCard(
                    category: "fragrances",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryCard(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ProductCard()
            ],
          ),
        ),
      ),
    );
  }
}
