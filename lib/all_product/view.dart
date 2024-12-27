import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:product/all_product/Widget/category_card.dart';
import 'package:product/all_product/Widget/product_card.dart';
import 'package:product/all_product/Widget/research_bar.dart';
import 'package:product/model/product_response/product_response.dart';
import 'package:product/product_detail/view.dart';
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
              Obx(() {
                return SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryCard(
                            category: state.categories.value[index]);
                      }),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: GetBuilder<AllProductLogic>(builder: (logic) {
                return PagedListView(
                  pagingController: state.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<ProductResponse>(
                    itemBuilder: (context, item, index) => ProductCard(
                      thumnail: item.thumbnail,
                      title: "${item.title} + ${item.id}",
                      description: item.description,
                      price: item.price,
                      discount: item.discountPercentage,
                      onPressed: () {
                        Get.toNamed(AppRoute.PRODUCTDETAIL,
                            arguments: {"productId": item.id});
                      },
                    ),
                  ),
                );
              })
                  // child: ListView.builder(
                  //     // shrinkWrap: true,
                  //     physics: AlwaysScrollableScrollPhysics(),
                  //     itemCount: state.productList.value.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       var item = state.productList.value[index];
                  //       return ProductCard(
                  //         thumnail: item.thumbnail,
                  //         title: item.title,
                  //         description: item.description,
                  //         price: item.price,
                  //         discount: item.discountPercentage,
                  //         onPressed: () {
                  //           Get.toNamed(AppRoute.PRODUCTDETAIL,
                  //               arguments: {"productId": item.id});
                  //         },
                  //       );
                  //     }),
                  )
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
