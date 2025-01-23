import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'state.dart';

class AddProductLogic extends GetxController {
  final AddProductState state = AddProductState();

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
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
}
