import 'package:flutter/material.dart';
import 'package:product/add_product.dart';

class DetailProduct extends StatelessWidget {
  final void Function()? onDelete;
  final double? price;
  final double? discountPercent;
  final String? title;
  final String? description;
  final int? stock;
  final double? rating;
  final String? category;
  final String? brand;
  final String? warranty;
  final String? reviewerName;
  final String? email;
  final String? comment;
  final double? reviewerRating;
  final DateTime? date;

  DetailProduct({
    super.key,
    this.onDelete,
    this.price,
    this.discountPercent,
    this.title,
    this.description,
    this.stock,
    this.rating,
    this.category,
    this.brand,
    this.warranty,
    this.reviewerName,
    this.email,
    this.comment,
    this.reviewerRating,
    this.date,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                height: 1000,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        padding: EdgeInsets.all(10),
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
                    Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 0.2, color: Colors.black12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 3),
                                  blurRadius: 3,
                                )
                              ]),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      title ?? "Essence Mascara Lash Princess",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(category ?? "Beauty"),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 1,
                                        color: Colors.black12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Price: ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                price != null
                                                    ? price.toString()
                                                    : "10",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "\$",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Discount: ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                price != null
                                                    ? price.toString()
                                                    : "10",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red[300]),
                                              ),
                                              Text(
                                                "%",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red[300]),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 0.5,
                                        color: Colors.black12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Description",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(description ??
                                              "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula."),
                                        ],
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 1,
                                        color: Colors.black12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Stock",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            stock != null
                                                ? stock.toString()
                                                : "10",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 1,
                                        color: Colors.black12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rating",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
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
                                                rating != null
                                                    ? rating.toString()
                                                    : "3.6",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 0.5,
                                        color: Colors.black12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Brand",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            brand ?? "Essence",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Waranty Information",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            warranty ?? "1 month warranty",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Shipping Information",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            warranty ?? "Ships in 1 month",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Availability Status",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            warranty ?? "Low Stock",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 0.2, color: Colors.black12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 3),
                                  blurRadius: 3,
                                )
                              ]),
                          child: Column(
                            children: [
                              Text(reviewerName ?? "Scarlett Wright",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                              Text(
                                email ?? "scarlett.wright@x.dummyjson.com",
                              ),
                              Container(
                                height: 1,
                                color: Colors.black12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        comment ??
                                            "Very unhappy with my purchase!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(reviewerRating != null
                                              ? reviewerRating.toString()
                                              : "3")
                                        ],
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    date != null
                                        ? date.toString()
                                        : "2024-05-23 08:56:21",
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
