import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/services/cart_service.dart';
import 'package:grocery_app/widget/green_button.dart';
import 'package:grocery_app/style/colors.dart';
import '../style/theme.dart';
import '../widget/back_home.dart';
import '../widget/card_list_item.dart';
import 'order_accepted_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartService service = CartService();
  Cart? cart;
  List<Cart> cartList = [];
  List<int> price = [];
  int total = 0;
  @override
  void initState() {
    super.initState();
    service.getCart().then((value) => setState(() {
          try {
            cartList = value!;
            for (int i = 0; i < cartList.length; i++) {
              total += cartList[i].price;
              print(total.toString());
            }
          } catch (e) {
            print(e.toString());
          }
        }));
  }

  int amount = 0;
  String _selectedItem = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          _appBar(),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 480,
                child: CartListItem(
                  total: total,
                ),
              ),
            ],
          ),
          Expanded(child: _CartButton(context, total))
        ],
      ),
    );
  }

  GestureDetector _CartButton(BuildContext context, int total) {
    return GestureDetector(
      onTap: () {
        _bottomSheet(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        width: MediaQuery.of(context).size.width - 40,
        height: 85,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "Go To Check Out",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            Text(
              "$total\$",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.60,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Checkout",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 27,
                      ))
                ],
              ),
              const Divider(
                thickness: 0.8,
                color: AppColors.darkGrey,
              ),
              _checkoutTile(
                title: "Delivery",
                widgett: Text(
                  "Select Method",
                  style: style3,
                ),
                press: () {},
                size: MediaQuery.of(context).size.width - 310,
              ),
              _checkoutTile(
                title: "Payment",
                widgett: const Icon(Icons.payment),
                press: () {},
                size: MediaQuery.of(context).size.width - 220,
              ),
              _checkoutTile(
                  title: "Promo Code",
                  widgett: Text(
                    "Pick Discount",
                    style: style3,
                  ),
                  press: () {},
                  size: MediaQuery.of(context).size.width - 340),
              _checkoutTile(
                  title: "Total Cost",
                  widgett: Text(
                    "$total\$",
                    style: style3,
                  ),
                  press: () {},
                  size: MediaQuery.of(context).size.width - 237),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "By placing an order you agree to our",
                    style: style1,
                  ),
                  Text(
                    "Terms",
                    style: style2,
                  ),
                  Text(
                    "And",
                    style: style1,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Conditions",
                  style: style2,
                ),
              ),
              const SizedBox(
                height: 13.5,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _showDialog(context);
                  },
                  child: const GreenButton(
                    text: "Place Order",
                    height: 55,
                  ))
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            insetPadding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 600,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 30,
                      )),
                  const SizedBox(
                    height: 70,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 225,
                      decoration: const BoxDecoration(
                          color: Color(0xFFE8F5E9), shape: BoxShape.circle),
                      width: MediaQuery.of(context).size.width - 150,
                      alignment: Alignment.bottomCenter,
                      child:
                          Image.asset("assets/images/order_failed_image.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Oops! Order Failed",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Something went temply wrong",
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const OrderAcceptedPage()));
                      },
                      child: const GreenButton(
                        text: "Please Try Again",
                        height: 55,
                      ),
                    ),
                  ),
                  const BackHome(
                    fontWeight: FontWeight.w500,
                    size: 21,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Column _checkoutTile(
      {required String title,
      required Widget widgett,
      required VoidCallback press,
      required double size}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: size,
            ),
            widgett,
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: press, icon: const Icon(Icons.arrow_forward_ios)),
          ],
        ),
        const Divider(
          thickness: 0.8,
          color: AppColors.darkGrey,
        ),
      ],
    );
  }

  void selectedItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }

  Container _appBar() {
    return Container(
      height: 95,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "My Cart",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
