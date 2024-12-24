import 'package:get/get.dart';
import 'package:product/add_product/view.dart';

import 'logic.dart';

class AllProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllProductLogic());
  }
}
