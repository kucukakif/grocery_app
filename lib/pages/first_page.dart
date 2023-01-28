import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/pages/botom_nav_bar.dart';

import '../style/colors.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Color(0xFF303030),
            image: DecorationImage(
                image: AssetImage("assets/images/welcome_image.png"),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 400,
            ),
            SvgPicture.asset("assets/icons/app_icon.svg"),
            const Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            const Text(
              "to our store",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Get your grecories as fast as in hour",
              style: TextStyle(color: Color(0xFFE0E0E0), fontSize: 17),
            ),
            const SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBar()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 55,
                width: 350,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
