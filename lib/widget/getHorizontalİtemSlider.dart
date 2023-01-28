// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/pages/properties_details.dart';
import 'package:grocery_app/widget/beverages_item_widget.dart';

Widget getHorizontalItemSlider(List<Properties> items) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 285,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PropertiesDetails(
                            item: items[index],
                          )));
            },
            child: BeveragesCardWidget(
              item: items[index],
            ),
          );
        },
      ));
}