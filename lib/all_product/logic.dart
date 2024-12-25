import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:product/all_product/view.dart';
import 'package:product/model/product_response/product_response.dart';

import 'state.dart';

class AllProductLogic extends GetxController {
  final AllProductState state = AllProductState();

  @override
  void onInit() {
    super.onInit();
    fetchProduct(); // Call the function to fetch data on controller initialization
    fetchCategory();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCategory();
  }

  Future<void> fetchProduct() async {
    final dio = Dio();

    try {
      final response = await dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        final productList = jsonData['products'] as List<dynamic>;
        state.productList.value =
            productList.map((data) => ProductResponse.fromJson(data)).toList();
        // update();
      } else {
        // Handle unexpected status code if needed
        print("Unexpected status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle Dio errors
      print("Error fetching data: $e");
    }
  }

  Future<void> fetchCategory() async {
    final dio = Dio();

    try {
      final response =
          await dio.get('https://dummyjson.com/products/category-list');

      if (response.statusCode == 200) {
        state.categories.value = List<String>.from(response.data);
        update();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      // Handle Dio errors
      print("Error fetching data: $e");
    }
  }

// void detailScreen(
//   String? title,
//   double? price,
//   double? discount,
//   String? description,
//   int? stock,
//   double? rating,
//   String? brand,
//   String? warantyInfo,
//   String? shipping,
//   String? availabilityStatus,
// ) {
//   Get.toNamed(AppRoute.PRODUCTDETAIL(
//     title: item.title,
//     description: item.description,
//     price: item.price,
//     discount: item.discountPercentage,
//     stock: item.stock,
//     rating: item.rating,
//     brand: item.brand,
//     warantyInfo: item.warrantyInformation,
//     shipping: item.shippingInformation,
//     availabilityStatus: item.availabilityStatus,
//   ));
// }
}
