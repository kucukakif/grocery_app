import 'package:flutter/material.dart';
import 'package:grocery_app/style/colors.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final double height;
  const GreenButton({
    Key? key,
    required this.text, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
