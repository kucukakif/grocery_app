import 'package:flutter/material.dart';
import 'package:grocery_app/models/category_item.dart';
import 'package:grocery_app/pages/beverages_page.dart';
import 'package:grocery_app/style/theme.dart';
import 'package:grocery_app/widget/search_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Color> gridColors = [
    const Color.fromARGB(255, 180, 243, 203),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    const Color(0xff836AF6),
    const Color(0xffD73B77),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Find Products",
                    style: f20w9,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                textField(context),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  padding: const EdgeInsets.all(20),
                  mainAxisSpacing: 11,
                  children: [
                    explore_widget(
                        widgett: const Scaffold(),
                        color: gridColors[0],
                        color1: gridColors[0],
                        images: categoryItemsDemo[0].imagePath,
                        title: categoryItemsDemo[0].name),
                    explore_widget(
                        widgett: const Scaffold(),
                        color: gridColors[1],
                        color1: gridColors[1],
                        images: categoryItemsDemo[1].imagePath,
                        title: categoryItemsDemo[1].name),
                    explore_widget(
                        widgett: const Scaffold(),
                        color: gridColors[2],
                        color1: gridColors[2],
                        images: categoryItemsDemo[2].imagePath,
                        title: categoryItemsDemo[2].name),
                    explore_widget(
                        widgett: const Scaffold(),
                        color: gridColors[3],
                        color1: gridColors[3],
                        images: categoryItemsDemo[3].imagePath,
                        title: categoryItemsDemo[3].name),
                    explore_widget(
                        widgett: const Scaffold(),
                        color: gridColors[4],
                        color1: gridColors[4],
                        images: categoryItemsDemo[4].imagePath,
                        title: categoryItemsDemo[4].name),
                    explore_widget(
                        widgett: const BeveragesPage(),
                        color: gridColors[5],
                        color1: gridColors[5],
                        images: categoryItemsDemo[5].imagePath,
                        title: categoryItemsDemo[5].name)
                  ],
                )
              ],
            )));
  }
  GestureDetector explore_widget(
      {required Color color,
      required Color color1,
      required String images,
      required String title,
      required Widget widgett}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widgett));
      },
      child: Container(
        width: 175,
        height: 175,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5, color: color1),
        ),
        child: Column(
          children: [
            Image.asset(
              images,
              height: 110,
              width: 110,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
    );
  }
}
