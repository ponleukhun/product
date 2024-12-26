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
    fetchProduct(); // Call the function to fetch data on controller initialization
    fetchCategory();
    state.pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
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

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems =
          await RemoteApi.getList(pageKey, state.productList.length);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        state.pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        state.pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      state.pagingController.error = error;
    }
  }
}
