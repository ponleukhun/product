import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:product/product_detail/binding.dart';
import 'package:product/product_detail/view.dart';

import '../all_product/binding.dart';
import '../all_product/view.dart';

class AppRoute {
  static const ALLPRODUCT = "/all_product";
  static const PRODUCTDETAIL = "/product_detail";
  static final pages = [
    GetPage(
      name: ALLPRODUCT,
      page: () => AllProductPage(),
      binding: AllProductBinding(),
    ),
    GetPage(
      name: PRODUCTDETAIL,
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
  ];
}
