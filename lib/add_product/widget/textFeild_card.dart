import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String? title;
  final String? text;

  Textfield({super.key, this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title ?? ""),
      TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.green.withOpacity(0.15),
          border: OutlineInputBorder(),
          hintText: text ?? "",
        ),
      )
    ]);
  }
}
