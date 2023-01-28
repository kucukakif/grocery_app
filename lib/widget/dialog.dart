// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/services/cart_service.dart';
import 'package:grocery_app/style/colors.dart';

TextStyle style = const TextStyle(
    color: AppColors.primaryColor, fontSize: 19, fontWeight: FontWeight.bold);

class Diyalog extends StatefulWidget {
  Properties item;
  Diyalog({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<Diyalog> createState() => _DiyalogState();
}

class _DiyalogState extends State<Diyalog> {
  late Properties item;
  CartService service = CartService();
  List<Cart> list = [];
  @override
  void initState() {
    super.initState();
    item = widget.item;
    service.getCart().then((value) => setState(() {
          if (value != null) {
            list = value;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                title: const Text(
                  'Karar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                content: const Text(
                  'Ürün sepete ekleniyor!',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Hayır',
                      style: style,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      List<bool> deger = [];
                      List<bool> deger1 = [];
                      if (list.isEmpty) {
                        service.postCart(
                            price: item.price,
                            piece: item.piece,
                            name: item.name,
                            number: item.id,
                            pictureUrl: item.pictureUrl,
                            description: item.description);
                      }
                      for (int i = 0; i < list.length; i++) {
                        if (list[i].name == item.name) {
                          int v = list[i].piece + item.piece;
                          int y = list[i].price + item.price;
                          service.putCart(
                              price: y,
                              piece: v,
                              name: list[i].name,
                              number: list[i].id,
                              pictureUrl: list[i].pictureUrl,
                              description: list[i].description,
                              id: list[i].id);
                        }
                        if (list[i].name != item.name) {
                          deger = [true];
                        } else {
                          deger1 = [true];
                        }
                      }
                      if (deger.length > deger1.length) {
                        service.postCart(
                            price: item.price,
                            piece: item.piece,
                            name: item.name,
                            number: item.id,
                            pictureUrl: item.pictureUrl,
                            description: item.description);
                      }

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Evet',
                      style: style,
                    ),
                  )
                ],
              );
            });
      },
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
    );
  }
}
