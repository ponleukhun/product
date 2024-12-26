import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:product/model/product_response/product_response.dart';
import 'package:product/model/product_response/review.dart';

class ProductDetailState {
  var product = ProductResponse().obs;
  var productId = 0.obs;
}
