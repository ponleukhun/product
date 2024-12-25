import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:product/add_product/binding.dart';
import 'package:product/add_product/view.dart';
import 'package:product/model/product_response/product_response.dart';
import 'package:product/product_detail/binding.dart';
import 'package:product/product_detail/view.dart';

import '../all_product/binding.dart';
import '../all_product/view.dart';

class AppRoute {
  static const ALLPRODUCT = "/all_product";
  static const PRODUCTDETAIL = "/product_detail";
  static const ADDPRODUCT = "/add_product";
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
    GetPage(
      name: ADDPRODUCT,
      page: () => AddProductPage(),
      binding: AddProductBinding(),
    ),
  ];
}
