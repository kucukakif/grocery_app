import 'package:flutter/material.dart';
import 'package:grocery_app/models/account_data.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/pages/card_item_add_page.dart';
import 'package:grocery_app/pages/filters_page.dart';
import 'package:grocery_app/pages/properties_details.dart';
import 'package:grocery_app/services/properties_service.dart';
import 'package:grocery_app/style/theme.dart';
import 'package:grocery_app/widget/beverages_item_widget.dart';

class BeveragesPage extends StatefulWidget {
  const BeveragesPage({super.key});

  @override
  State<BeveragesPage> createState() => _BeveragesPageState();
}

class _BeveragesPageState extends State<BeveragesPage> {
  PropertiesService service = PropertiesService();
  Properties? properties;
  List<Properties> beveragesList = beverage_items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Beverages",
              style: f25w9,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FiltersPage()));
                    },
                    icon: const Icon(
                      Icons.sort,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardItemAddPage()));
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 32,
                  )),
            ],
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ))),
        body: GridView.count(
          childAspectRatio: 0.7,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: [
            for (int i = 0; i < beveragesList.length; i++)
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PropertiesDetails(item: beveragesList[i])));
                  },
                  child: BeveragesCardWidget(item: beveragesList[i]))
          ],
        ));
  }
}
