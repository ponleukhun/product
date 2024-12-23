import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:product/model/product_response/product_response.dart';

import 'state.dart';

class AllProductLogic extends GetxController {
  final AllProductState state = AllProductState();

  @override
  void onInit() {
    super.onInit();
    fetchToDo(); // Call the function to fetch data on controller initialization
  }

  Future<void> fetchToDo() async {
    final dio = Dio();

    try {
      final response = await dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        final productList = jsonData['products'] as List<dynamic>;
        state.productList.value =
            productList.map((data) => ProductResponse.fromJson(data)).toList();
      } else {
        // Handle unexpected status code if needed
        print("Unexpected status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle Dio errors
      print("Error fetching data: $e");
    }
  }
}
