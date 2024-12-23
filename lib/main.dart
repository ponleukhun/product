import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:product/add_product.dart';
import 'package:product/all_product/binding.dart';
import 'package:product/all_product/view.dart';
import 'package:product/route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AllProductPage(),
      initialRoute: AppRoute.ALLPRODUCT,
      getPages: AppRoute.pages,
    );
  }
}
