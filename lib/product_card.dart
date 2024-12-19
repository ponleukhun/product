import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? title;
  final String? description;
  final double? price;
  final double? discountPercent;
  final void Function()? onPressed;
  final void Function()? onDelete;
  final void Function()? onUpdate;
  const ProductCard(
      {super.key,
      this.title,
      this.description,
      this.price,
      this.discountPercent,
      this.onPressed,
      this.onDelete,
      this.onUpdate});

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
        child: Row(
          children: [
            Container(
              width: 100,
              child: Image.network(
                  'https://th.bing.com/th/id/OIP.1zAR2E_qvxtmKokY3uHZvwHaHa?w=1024&h=1024&rs=1&pid=ImgDetMain'),
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
                              onPressed: onUpdate,
                            ),

                            ///Delete To Do
                            MenuItemButton(
                                leadingIcon: const Icon(Icons.delete),
                                child: const Text(
                                  "Delete",
                                ),

                                ///Showing dialog box
                                onPressed: onDelete)
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                  Text(
                      description ??
                          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
                      style: TextStyle(fontSize: 9)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(price != null ? price.toString() : '12',
                              style: TextStyle(fontSize: 12)),
                          Text('\$', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              discountPercent != null
                                  ? discountPercent.toString()
                                  : '15',
                              style: TextStyle(fontSize: 12)),
                          Text('%', style: TextStyle(fontSize: 12)),
                        ],
                      ),
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
