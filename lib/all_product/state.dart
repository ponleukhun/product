import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:product/model/product_response/product_response.dart';

class AllProductState {
  var productList = <ProductResponse>[].obs;
  var categories = <String>[].obs;
  var skip = 1.obs;
  var limit = 10.obs;
  PagingController<int, ProductResponse> pagingController =
      PagingController(firstPageKey: 1);
}
