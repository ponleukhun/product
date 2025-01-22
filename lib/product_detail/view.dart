import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/product_detail/widget/review.dart';

import 'logic.dart';
import 'state.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final ProductDetailLogic logic = Get.put(ProductDetailLogic());
  final ProductDetailState state = Get.find<ProductDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail "),
        backgroundColor: Colors.green.withOpacity(0.2),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          MenuAnchor(
            builder: (BuildContext context, MenuController controller,
                Widget? child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              );
            },

            ///List of menu
            menuChildren: [
              ///Update To Do
              MenuItemButton(
                leadingIcon: const Icon(Icons.update),
                child: const Text(
                  "Update",
                  selectionColor: Colors.lightBlueAccent,
                ),
                onPressed: () {},
              ),

              ///Delete To Do
              MenuItemButton(
                  leadingIcon: const Icon(Icons.delete),
                  child: const Text(
                    "Delete",
                  ),

                  ///Showing dialog box
                  onPressed: () {})
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProductDetailLogic>(builder: (logic) {
          if (state.product.value.reviews == null) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 300),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    _banner(),
                    _productInfo(),
                    _reviewList(),
                  ],
                ));
          }
        }),
      ),
    );
  }

  Widget _banner() {
    return GetBuilder<ProductDetailLogic>(builder: (logic) {
      return SizedBox(
        height: 150,
        width: 340,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: state.product.value.images?.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              width: 340,
              state.product.value.images![index].toString(),
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 160),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Center(
                  child: Text(
                    'Image failed to load',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            );
          },
        ),
      );
    });
  }

  Widget _productInfo() {
    return GetBuilder<ProductDetailLogic>(builder: (logic) {
      return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.15),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(15), right: Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${state.product.value.title}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + "${state.product.value.price}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${state.product.value.discountPercentage}" + "% off",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.red.shade600),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("${state.product.value.description}"),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 0.25,
              width: double.infinity,
              color: Colors.black38,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stock",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${state.product.value.stock}",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rating",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${state.product.value.rating}",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Brand",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  state.product.value.brand ?? "",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Waranty Information",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${state.product.value.warrantyInformation}",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${state.product.value.shippingInformation}",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Availability Status",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${state.product.value.availabilityStatus}",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    });
  }

  Widget _reviewList() {
    return GetBuilder<ProductDetailLogic>(builder: (logic) {
      return SizedBox(
        height: 150,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: state.product.value.reviews!.length,
          itemBuilder: (BuildContext context, int index) {
            var item = state.product.value.reviews?[index];
            return Review(
              name: item?.reviewerName,
              email: item?.reviewerEmail,
              comment: item?.comment,
              rate: item?.rating,
              date: item?.date,
            );
          },
        ),
      );
    });
  }
}
