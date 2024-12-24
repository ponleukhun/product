import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/add_product/widget/textFeild_card.dart';

import 'logic.dart';
import 'state.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final AddProductLogic logic = Get.put(AddProductLogic());

  final AddProductState state = Get.find<AddProductLogic>().state;

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
          child: Column(
            children: [
              //Title textfield
              Textfield(
                title: "Title",
                text: "Input Title",
              ),
              SizedBox(
                height: 10,
              ),
              //Description textfield
              Textfield(
                title: "Description",
                text: "Input Description",
              ),
              SizedBox(
                height: 10,
              ),
              //category dropdownList
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
                    // child: DropdownButton<String>(
                    //
                    //   icon: const Icon(Icons.arrow_drop_down),
                    //   elevation: 16,
                    //   style: const TextStyle(color: Colors.black87),
                    //   underline: Container(
                    //     height: 0,
                    //     color: Colors.green.withOpacity(0.15),
                    //   ),
                    //   isExpanded: true,
                    //   menuWidth: 250,
                    //   onChanged: (String? value) {
                    //     // This is called when the user selects an item.
                    //
                    //   },
                    // items: map<DropdownMenuItem<String>>((String value) {
                    //   return DropdownMenuItem<String>(
                    //     value: value,
                    //     child: Text(
                    //       value,
                    //       style: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.black.withOpacity(0.75)),
                    //     ),
                    //   );
                    //}).toList(),
                    // ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //price textfield
              Textfield(
                title: "Price",
                text: "Input Price",
              ),
              SizedBox(
                height: 10,
              ),
              //discount percent textfield
              Textfield(
                title: "Discount Percent",
                text: "Input Discount Percent",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  //Rating textfield
                  Expanded(
                      child: Textfield(
                    title: "Rating",
                    text: "Input Rating",
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  //Stock textfield
                  Expanded(
                      child: Textfield(
                    title: "Stock",
                    text: "Input Stock",
                  )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // add product button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green[200],
                        border: Border.all(color: Colors.black12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, offset: Offset(0, 1))
                        ]),
                    child: Text(
                      "Add",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  //Cancel button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green[200],
                        border: Border.all(color: Colors.black12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, offset: Offset(0, 1))
                        ]),
                    child: Text(
                      "Cancel",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
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
