import 'package:flutter/material.dart';
import 'package:product/get_all.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetAllProduct(),
    );
  }
}
