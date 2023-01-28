import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/services/cart_service.dart';
import 'package:grocery_app/widget/Item.dart';

class CartListItem extends StatefulWidget {
  int total;
  CartListItem({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  CartService service = CartService();
  List<Cart> cartList = [];
  int piece = 0;
  int price = 0;
  int newValue = 0;
  int amount = 0;
  String pictureUrl = "";
  String name = "";
  String description = "";
  int total = 0;
  @override
  void initState() {
    super.initState();
    total = widget.total;
    service.getCart().then((value) => setState(() {
          if (value != null) {
            cartList = value;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 2,
      shrinkWrap: true,
      crossAxisCount: 1,
      children: [
        for (int i = 0; i < cartList.length; i++)
          Item(
            cart: cartList[i],
          )
      ],
    );
  }
}
