// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  const GroceryItemTile({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    this.color,
    this.onpressed,
  }) : super(key: key);

  final String itemName;
  final String itemPrice;
  final String itemPath;
  final color;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(itemPath, height: 64),
          Text(itemName),
          MaterialButton(
            onPressed: onpressed,
            color: color[800],
            child: Text(
              "\$ $itemPrice",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
