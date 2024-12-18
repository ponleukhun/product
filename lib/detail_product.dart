import 'package:flutter/material.dart';
import 'package:product/add_product.dart';

class DetailProduct extends StatelessWidget {
  final void Function()? onDelete;

  DetailProduct({
    super.key,
    this.onDelete,
  });

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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddProduct()));
                  },
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
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 3)
                      ]),
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.jX61ytVi7DIfFXwdcEr9JAHaEf?rs=1&pid=ImgDetMain',
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.2, color: Colors.black12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 3),
                            blurRadius: 3,
                          )
                        ]),
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.2, color: Colors.black12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 3),
                            blurRadius: 3,
                          )
                        ]),
                  ))
            ],
          ),
        ));
  }
}
