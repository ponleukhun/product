import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/all_product/Widget/category_card.dart';
import 'package:product/all_product/Widget/product_card.dart';
import 'package:product/all_product/Widget/research_bar.dart';
import 'package:product/route/app_route.dart';

import 'logic.dart';
import 'state.dart';

class AllProductPage extends StatelessWidget {
  AllProductPage({Key? key}) : super(key: key);

  final AllProductLogic logic = Get.put(AllProductLogic());
  final AllProductState state = Get.find<AllProductLogic>().state;

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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                      category: "Beauty",
                    ),
                    const SizedBox(
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
              // ListView.builder(itemCount: state.productList.value.length,
              //     itemBuilder:  (BuildContext context, int index) {
              //   return ProductCard();
              // }),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text("${state.productList.value.length}"),
                    ProductCard(
                      // price: 20,
                      // discountPercent: 70,
                      //
                      // onUpdate: () {
                      //   Get.toNamed(AppRoute.ADDPRODUCT);
                      // },
                      onPressed: () {
                        Get.toNamed(AppRoute.PRODUCTDETAIL);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ProductCard(
                      // discountPercent: 50,
                      // price: 11.6,
                      //
                      // onUpdate: () {
                      //   Get.toNamed(AppRoute.ADDPRODUCT);
                      // }),
                      onPressed: () {
                        Get.toNamed(AppRoute.PRODUCTDETAIL);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ProductCard(
                      // discountPercent: 50,
                      // price: 11.6,
                      //
                      // onUpdate: () {
                      //   Get.toNamed(AppRoute.ADDPRODUCT);
                      // }
                      onPressed: () {
                        Get.toNamed(AppRoute.PRODUCTDETAIL);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ///show buttom sheet of Add
            Get.toNamed(AppRoute.ADDPRODUCT);
          },
          backgroundColor: Colors.green[200],
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
