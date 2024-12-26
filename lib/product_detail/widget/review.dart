import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Review extends StatelessWidget {
  final String? name;
  final String? email;
  final int? rate;
  final String? comment;
  final DateTime? date;

  const Review({
    super.key,
    this.name,
    this.email,
    this.rate,
    this.comment,
    this.date,
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
          ),
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
                        Text(name ?? "Scarlett Wright",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text(
                          email ?? "scarlett.wright@x.dummyjson.com",
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
                        Text(rate != null ? rate.toString() : " 3"),
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
                comment ?? "Very unhappy with my purchase!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${date}",
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
