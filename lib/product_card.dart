import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? title;
  final String? description;
  final double? price;
  final double? discountPercent;
  const ProductCard(
      {super.key,
      this.title,
      this.description,
      this.price,
      this.discountPercent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
                'https://th.bing.com/th/id/OIP.1zAR2E_qvxtmKokY3uHZvwHaHa?w=1024&h=1024&rs=1&pid=ImgDetMain'),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            title ?? "Essence Mascara Lash Princess",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                    ],
                  ),
                  SizedBox(
                    width: 10,
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
                      Text(price != null ? price.toString() : '12USD',
                          style: TextStyle(fontSize: 9)),
                      Text(
                          discountPercent != null
                              ? discountPercent.toString()
                              : '10%',
                          style: TextStyle(fontSize: 9)),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
