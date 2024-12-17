import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String? title;
  final String? text;
  Textfield({super.key, this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 80,
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ?? "Title"),
            TextField(
              decoration: InputDecoration(
                //  filled: true,
                fillColor: Colors.green.withOpacity(0.15),
                border: OutlineInputBorder(),
                hintText: text ?? "Input title",
              ),
            )
          ],
        ),
      ),
    );
  }
}
