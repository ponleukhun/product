import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:product/all_product/state.dart';
import 'package:product/model/product_response/product_response.dart';
import 'package:product/product_detail/widget/review.dart';

import 'state.dart';

class ProductDetailLogic extends GetxController {
  final ProductDetailState state = ProductDetailState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.productId.value = Get.arguments["productId"];
    fetchProductById();
  }

  Future<void> fetchProductById() async {
    final dio = Dio();

    try {
      final response = await dio
          .get('https://dummyjson.com/products/${state.productId.value}');

      if (response.statusCode == 200) {
        state.product.value = ProductResponse.fromJson(response.data);
        update();
      } else {
        print("Unexpected status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle Dio errors
      print("Error fetching data: $e");
    }
  }
}
