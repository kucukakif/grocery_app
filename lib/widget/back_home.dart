import 'package:flutter/material.dart';

class BackHome extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  const BackHome({
    Key? key,
    required this.fontWeight,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 60),
        child: Text(
          "Back To Home",
          style: TextStyle(fontSize: size, fontWeight: fontWeight),
        ),
      ),
    );
  }
}