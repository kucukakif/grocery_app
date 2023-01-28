import 'dart:io';
import 'package:flutter/material.dart';

import '../style/colors.dart';

Padding Description({required String item}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        item,
        style: const TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w700,
            fontSize: 17),
      ),
    ),
  );
}

Container productImage({required String item}) {
  return Container(
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.blue,
        gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF).withOpacity(0.1),
              const Color(0xFF3366FF).withOpacity(0.09),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))),
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 40),
    child: Image.asset(
      item,
      width: 250,
    ),
  );
}
