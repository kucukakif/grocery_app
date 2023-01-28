import 'package:flutter/material.dart';

Container textField(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 0),
    decoration: BoxDecoration(
      color: const Color(0xFFEEEEEE),
      borderRadius: BorderRadius.circular(20),
    ),
    width: MediaQuery.of(context).size.width - 50,
    height: 55,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: const TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
          hintText: "Search Store",
          hintStyle: TextStyle(
              color: Color(0xFF757575),
              fontSize: 17,
              fontWeight: FontWeight.bold)),
    ),
  );
}
