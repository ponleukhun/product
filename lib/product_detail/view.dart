import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/product_detail/widget/review.dart';

import 'logic.dart';
import 'state.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key}) : super(key: key);

  final ProductDetailLogic logic = Get.put(ProductDetailLogic());
  final ProductDetailState state = Get.find<ProductDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Detail"),
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
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                _banner(),
                _productInfo(),
                _reviewList(),
              ],
            ),
          ),
        ));
  }
}

Widget _banner() {
  return Container(
    width: double.infinity,
    height: 150,
    child: Image.network(
      'https://th.bing.com/th/id/OIP.jX61ytVi7DIfFXwdcEr9JAHaEf?rs=1&pid=ImgDetMain',
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
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
      width: double.infinity,
    ),
  );
}

Widget _productInfo() {
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
          "Essence Mascara Lash Princess",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$10",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              "10% off",
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
        Text(
            "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula."),
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
              "10",
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
                  "3.6",
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
              "Essence",
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
              "1 month warranty",
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
              "Shipping Information",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              "Ships in 1 month",
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
              "Low Stock",
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
}

Widget _reviewList() {
  return SizedBox(
    height: 150,
    width: double.infinity,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Review();
      },
    ),
  );
}
