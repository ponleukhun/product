import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //width: MediaQuery.of(context).size.width,
          width: 340,
          margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.13),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.2, color: Colors.black12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 3,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Scarlett Wright",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text(
                          "scarlett.wright@x.dummyjson.com",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(" 3"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 0.25,
                width: double.infinity,
                color: Colors.black38,
              ),
              Text(
                "Very unhappy with my purchase!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "3 month ago",
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
