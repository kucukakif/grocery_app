import 'package:flutter/material.dart';

import '../style/theme.dart';

class RevulationSour extends StatefulWidget {
  IconData iconData;
  Color iconColor;
  double value;
  IconData iconData1;
  Color iconColor1;
  RevulationSour({
    Key? key,
    required this.iconData,
    required this.iconColor,
    required this.value,
    required this.iconData1,
    required this.iconColor1,
  }) : super(key: key);

  @override
  State<RevulationSour> createState() => _RevulationSourState();
}

class _RevulationSourState extends State<RevulationSour> {
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              amount--;
            });
          },
          child: Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.symmetric(horizontal: widget.value),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1.3, color: const Color(0xFFE0E0E0)),
            ),
            child: Icon(
              widget.iconData1,
              color: widget.iconColor1,
            ),
          ),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          alignment: Alignment.center,
          width: 35,
          child: _text(),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              amount++;
            });
          },
          child: Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.symmetric(horizontal: widget.value),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1.3, color: const Color(0xFFE0E0E0)),
            ),
            child: Icon(
              widget.iconData,
              color: widget.iconColor,
            ),
          ),
        ),
      ],
    );
  }

  InkWell _text() {
    return InkWell(
        onTap: () {
          setState(() {
            (newAmount) {
              newAmount = amount;
            };
          });
        },
        child: Text(amount.toString(), style: f25w9));
  }
}
