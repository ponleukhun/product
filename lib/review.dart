import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final String? reviewerName;
  final String? email;
  final String? comment;
  final double? reviewerRating;
  final DateTime? date;
  const Review(
      {super.key,
      this.reviewerName,
      this.email,
      this.comment,
      this.reviewerRating,
      this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
          Text(reviewerName ?? "Scarlett Wright",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          Text(
            email ?? "scarlett.wright@x.dummyjson.com",
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Text(
            comment ?? "Very unhappy with my purchase!",
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(reviewerRating != null ? reviewerRating.toString() : "3"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date != null ? date.toString() : "2024-05-23 08:56:21",
                style: TextStyle(color: Colors.black45),
              ),
            ],
          )
        ],
      ),
    );
  }
}
