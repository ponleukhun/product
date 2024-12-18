import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product/add_product.dart';
import 'package:product/bottom_navigator_bar.dart';
import 'package:product/category_card.dart';
import 'package:product/detail_product.dart';
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
          child: Column(
            children: [
              const ResearchBar(),
              const SizedBox(
                height: 15,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
                    CategoryCard(
                      category: "funiture",
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CategoryCard(
                      category: "Computer",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ProductCard(
                price: 20,
                discountPercent: 70,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailProduct()));
                },
                onUpdate: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddProduct()));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ProductCard(
                  discountPercent: 50,
                  price: 11.6,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailProduct()));
                  },
                  onUpdate: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddProduct()));
                  })
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigatorBar_(),
      ),
    );
  }
}
