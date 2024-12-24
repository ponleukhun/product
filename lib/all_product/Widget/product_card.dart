import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final void Function()? onPressed;

  const ProductCard({
    super.key,
    this.onPressed,
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
        child: Row(
          children: [
            Container(
              width: 100,
              child: Image.network(
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
                          "Essence Mascara Lash Princess ",
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
                  Text(
                      "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
                      style: TextStyle(fontSize: 9)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$12', style: TextStyle(fontSize: 12)),
                      Text('15' + '%', style: TextStyle(fontSize: 12)),
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
