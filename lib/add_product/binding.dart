import 'package:get/get.dart';

import 'logic.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductLogic());
  }
}
