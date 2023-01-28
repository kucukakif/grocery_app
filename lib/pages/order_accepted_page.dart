import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/widget/green_button.dart';
import '../widget/back_home.dart';

class OrderAcceptedPage extends StatefulWidget {
  const OrderAcceptedPage({super.key});

  @override
  State<OrderAcceptedPage> createState() => _OrderAcceptedPageState();
}

class _OrderAcceptedPageState extends State<OrderAcceptedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            SvgPicture.asset("assets/icons/order_accepted_icon.svg"),
            const SizedBox(
              height: 65,
            ),
            const Text(
              "You Order Has \nBeen Accepted",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Tour item has been placed and is \n   on it's way to being processed",
              style: style1,
            ),
            const SizedBox(
              height: 90,
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const GreenButton(text: "Track Order",height: 55,)),
            const SizedBox(
              height: 20,
            ),
            const BackHome(
              fontWeight: FontWeight.w600,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle style1 = const TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 18);
}
