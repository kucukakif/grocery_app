import 'package:flutter/material.dart';

import '../models/grocery_item.dart';
import '../style/colors.dart';

class GroceryItemCardWidget extends StatefulWidget {
  final GroceryItem item;
  const GroceryItemCardWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<GroceryItemCardWidget> createState() => _GroceryItemCardWidgetState();
}

class _GroceryItemCardWidgetState extends State<GroceryItemCardWidget> {
  late GroceryItem item;
  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.3, color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 320,
      width: 177,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 7),
            child: Image.asset(
              item.imagePath,
              width: 110,
              height: 80,
            ),
          ),
          Container(
            height: 45,
            width: 85,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              item.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              item.description,
              style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.price.toString(),
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w900),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 15,
                      left: 25,
                    ),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
