import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:product/all_product/view.dart';
import 'package:product/model/product_response/product_response.dart';

import 'state.dart';

class AllProductLogic extends GetxController {
  final AllProductState state = AllProductState();

  @override
  void onInit() {
    super.onInit();
    // fetchProduct(); // Call the function to fetch data on controller initialization
    fetchCategory();
    fetchSkip();
    state.pagingController.addPageRequestListener((pageKey) {
      fetchSkip();
    });
  }

  @override
  void onReady() {
    super.onReady();
    fetchCategory();
  }

  // Future<void> fetchProduct() async {
  //   final dio = Dio();
  //
  //   try {
  //     final response = await dio.get('https://dummyjson.com/products');
  //
  //     if (response.statusCode == 200) {
  //       final jsonData = response.data as Map<String, dynamic>;
  //       final productList = jsonData['products'] as List<dynamic>;
  //       state.productList.value =
  //           productList.map((data) => ProductResponse.fromJson(data)).toList();
  //       update();
  //     } else {
  //       // Handle unexpected status code if needed
  //       print("Unexpected status code: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     // Handle Dio errors
  //     print("Error fetching data: $e");
  //   }
  // }

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

  Future<void> fetchSkip() async {
    final dio = Dio();

    try {
      // Ensure the correct skip and limit values
      final response = await dio.get(
          'https://dummyjson.com/products?limit=10&skip=${state.skip.value}');

      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        final productList = jsonData['products'] as List<dynamic>;

        // Update product list with new items fetched from API
        final newItems =
            productList.map((data) => ProductResponse.fromJson(data)).toList();

        // Determine if this is the last page
        final isLastPage = newItems.length < 10;

        // If it's the last page, append the last page to PagingController
        if (isLastPage) {
          state.pagingController.appendLastPage(newItems);
        } else {
          // Calculate the next page key (skip + the number of items fetched)
          final nextPageKey = state.skip.value + 1;
          state.pagingController.appendPage(newItems, nextPageKey);
        }

        // Update the skip value for the next page
        state.skip.value += 10; // Increment skip by 10 to go to next page

        update();
      } else {
        // Handle unexpected status code
        print("Unexpected status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle Dio errors
      print("Error fetching data: $e");
    }
  }

// Future<void> fetchPage() async {
//   try {
//     final newItems = await RemoteApi.getBeerList(state.skip, state.limit);
//     final isLastPage = newItems.length < state.limit;
//     state.productList.value
//         .map((data) => ProductResponse.fromJson(data))
//         .toList();
//     final isLastPage = newItems.length < state.limit;
//     if (isLastPage) {
//       state.pagingController.appendLastPage(newItems);
//     } else {
//       final nextPageKey = state.skip + newItems.length;
//       state.pagingController.appendPage(newItems, nextPageKey as int?);
//     }
//   } catch (error) {
//     state.pagingController.error = error;
//   }
// }
}
