import 'package:flutter/material.dart';

const List<String> list = <String>[
  "Choose Category",
  'Beauty',
  'Smart Phone',
  'Fregants',
  'Funiture'
];

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 120,
          width: double.infinity,
          color: Colors.white,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Product",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Please fill the information below:",
                style: TextStyle(fontSize: 13, color: Colors.black45),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          color: Colors.white,
          // child: Column(
          //   children: [
          //     TextField(),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     TextField(),
          //   ],
          // ),

          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green.withOpacity(0.15),
                      border: OutlineInputBorder(),
                      hintText: "Input title",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description"),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green.withOpacity(0.15),
                      border: OutlineInputBorder(),
                      hintText: "Input description",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category"),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1)),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black87),
                      underline: Container(
                        height: 0,
                        color: Colors.green.withOpacity(0.15),
                      ),
                      isExpanded: true,
                      menuWidth: 250,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.75)),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price"),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green.withOpacity(0.15),
                      border: OutlineInputBorder(),
                      hintText: "Input Price",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Discount Percent"),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green.withOpacity(0.15),
                      border: OutlineInputBorder(),
                      hintText: "Input Discount Percent",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rating"),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.withOpacity(0.15),
                            border: OutlineInputBorder(),
                            hintText: "Input Rating",
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Stock"),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.withOpacity(0.15),
                            border: OutlineInputBorder(),
                            hintText: "Input Stock",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ],
              )
            ],
          ),
        ))
      ],
    ));
  }
}
