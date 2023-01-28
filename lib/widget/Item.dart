import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/pages/properties_details.dart';
import 'package:grocery_app/services/cart_service.dart';
import 'package:grocery_app/services/properties_service.dart';
import 'package:grocery_app/style/colors.dart';
import 'package:grocery_app/style/theme.dart';

class Item extends StatefulWidget {
  Cart cart;
  Item({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Cart? cart;
  PropertiesService service1 = PropertiesService();
  CartService service = CartService();
  List<Cart> cartList = [];
  List<Properties> propertiList = [];
  int piece = 0;
  int price = 0;
  int newValue = 0;
  int amount = 0;
  String pictureUrl = "";
  String name = "";
  String description = "";
  late Properties propertie;
  @override
  void initState() {
    super.initState();
    cart = widget.cart;
    name = cart!.name;
    newValue = cart!.price;
    amount = cart!.piece;
    price = cart!.price ~/ cart!.piece;
    pictureUrl = cart!.pictureUrl;
    description = cart!.description;
    service.getCart().then((value) => setState(() {
          if (value != null) {
            cartList = value;
          }
        }));
    service1.getProperties().then((value) => setState(() {
          if (value != null) {
            propertiList = value;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            height: 185,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PropertiesDetails(item: propertie)));
                      },
                      child: Image.asset(
                        pictureUrl,
                        width: 115,
                        height: 115,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        description,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (amount > 1) {
                                amount--;
                                newValue = newValue - price;
                              } else {
                                null;
                              }
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1.3, color: const Color(0xFFE0E0E0)),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 35,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  (newAmount) {
                                    newAmount = amount;
                                  };
                                });
                              },
                              child: Text(amount.toString(), style: f25w9)),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              amount++;
                              newValue = newValue + price;
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1.3, color: const Color(0xFFE0E0E0)),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            service.deleteCart(id: cart!.id);
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                        )),
                    const SizedBox(
                      height: 44,
                    ),
                    Text(
                      "${newValue.toString()}\$",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void function(int deger, Widget widget, Widget widget1) {
    if (deger <= 30) {
      widget;
    } else {
      widget1;
    }
  }
}
