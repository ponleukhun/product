import 'package:flutter/material.dart';
import 'package:product/add_product.dart';

class BottomNavigatorBar_ extends StatelessWidget {
  BottomNavigatorBar_({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
          color: Colors.black,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddProduct()));
            },
            icon: Icon(Icons.add),
            color: Colors.black12,
          ),
          label: 'ADD'),
    ]);
  }
}
