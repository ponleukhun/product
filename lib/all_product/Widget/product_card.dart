import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final void Function()? onPressed;
  final String? title;
  final String? description;
  final double? price;
  final double? discount;
  final Uint8List? imageUrl;

  const ProductCard({
    super.key,
    this.onPressed,
    this.title,
    this.description,
    this.price,
    this.discount,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.23),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              width: 100,
              child: Image.network(
                // Base64Decoder().convert("$imageUrl") != null
                //     ? Base64Decoder().convert("$imageUrl").toString()
                // :
                'https://th.bing.com/th/id/OIP.1zAR2E_qvxtmKokY3uHZvwHaHa?w=1024&h=1024&rs=1&pid=ImgDetMain',
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
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Center(
                    child: Text(
                      'Image failed to load',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          title ?? "Essence Mascara Lash Princess ",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: MenuAnchor(
                          builder: (BuildContext context,
                              MenuController controller, Widget? child) {
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
                      )
                    ],
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      description ??
                          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
                      style: TextStyle(fontSize: 10)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$' + (price != null ? price.toString() : "12"),
                          style: TextStyle(fontSize: 12)),
                      Text(
                          (discount != null ? discount.toString() : "11") + "%",
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
