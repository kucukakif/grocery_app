import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/services/cart_service.dart';
import 'package:grocery_app/widget/dialog.dart';
import '../style/colors.dart';

class BeveragesCardWidget extends StatefulWidget {
  final Properties item;
  const BeveragesCardWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<BeveragesCardWidget> createState() => _BeveragesCardWidgetState();
}

class _BeveragesCardWidgetState extends State<BeveragesCardWidget> {
  late Properties item;
  CartService service = CartService();
  List<Cart> list = [];
  @override
  void initState() {
    super.initState();
    imageCache.clear();
    item = widget.item;
    service.getCart().then((value) => setState(() {
          if (value != null) {
            list = value;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
            child: Image.asset(
              item.pictureUrl,
              alignment: Alignment.center,
              width: 120,
              height: 88,
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
                  "${item.price.toString()}\$",
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w900),
                ),
                Diyalog(
                  item: item,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
