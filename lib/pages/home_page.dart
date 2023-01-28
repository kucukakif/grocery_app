import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/models/account_data.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/services/properties_service.dart';
import 'package:grocery_app/style/colors.dart';
import '../widget/getHorizontalİtemSlider.dart';
import '../widget/search_widget.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  PropertiesService service = PropertiesService();
  List<Properties> beveragesList = [];
  List<Properties> exclusiveOffers = [home_page_items[4], home_page_items[5]];
  List<Properties> bestSelling = [home_page_items[3], home_page_items[2]];
  List<Properties> groceries = [home_page_items[0], home_page_items[1]];
  @override
  void initState() {
    super.initState();
    // service.getProperties().then((value) => setState(() {
    //       if (value != null) {
    //         beveragesList = value;
    //         exclusiveOffers = [beveragesList[0], beveragesList[1]];
    //         bestSelling = [beveragesList[2], beveragesList[3]];
    //         groceries = [beveragesList[3], beveragesList[4]];
    //       }
    //     }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 65),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: textField(context),
            ),
            const SizedBox(
              height: 25,
            ),
            _discountBox(context),
            const SizedBox(
              height: 35,
            ),
            _categoryNameRow(name: "Exclusive Order", text: "See All"),
            getHorizontalItemSlider(
              exclusiveOffers,
            ),
            _categoryNameRow(name: "Best Selling", text: "See All"),
            getHorizontalItemSlider(bestSelling),
            const SizedBox(
              height: 10,
            ),
            _categoryNameRow(name: "Groceries", text: "See All"),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  GroceriesHorizontalWidget(
                    color: Color.fromARGB(255, 254, 216, 175),
                    img: "assets/images/pulses.png",
                    text: "Pulses",
                  ),
                  GroceriesHorizontalWidget(
                      color: Color.fromARGB(255, 139, 227, 171),
                      img: "assets/images/rise.png",
                      text: "Rise")
                ],
              ),
            ),
            getHorizontalItemSlider(groceries),
          ],
        ),
      ),
    );
  }

  Column _appBar() {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/icons/app_icon_color.svg",
          width: 40,
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/search_icon.svg"),
            const Text(
              " Khartoum, Sudan",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Padding _categoryNameRow({required String name, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w900),
          ),
          Text(
            text,
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }

  Container _discountBox(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: 110,
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: AssetImage("assets/images/banner_background.png"),
              fit: BoxFit.fill),
          color: Colors.transparent),
      child: Row(
        children: [
          Image.asset(
            "assets/images/banner_image.png",
            width: 105,
            height: 105,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Fresh Vegetables",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "Get Up To 40% OFF",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}

class GroceriesHorizontalWidget extends StatelessWidget {
  final Color color;
  final String img;
  final String text;
  const GroceriesHorizontalWidget({
    Key? key,
    required this.color,
    required this.img,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 260,
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Image.asset(img),
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
