import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/favori_model.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/pages/properties_details.dart';
import 'package:grocery_app/services/favori_service.dart';
import 'package:grocery_app/services/properties_service.dart';
import 'package:grocery_app/style/colors.dart';

class FavoriListItem extends StatefulWidget {
  const FavoriListItem({
    super.key,
  });

  @override
  State<FavoriListItem> createState() => _FavoriListItemState();
}

class _FavoriListItemState extends State<FavoriListItem> {
  FavoriService service = FavoriService();
  List<Favori> favoriList = [];
  PropertiesService Pservice = PropertiesService();
  List<Properties> propertiesList = [];
  int amount = 0;
  int newValue = 0;
  String pictureUrl = "";
  String name = "";
  bool isFavori = false;
  String description = "";
  int categori = 0;
  int id = 0;
  @override
  void initState() {
    super.initState();
    imageCache.clear();
    service.getFavori().then((value) => setState(() {
          favoriList = value!;
        }));
    Pservice.getProperties().then((value) => setState(() {
          if (value != null) {
            propertiesList = value;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 1.9,
      children: [
        for (int i = 0; i < favoriList.length; i++)
          for (int x = 0; x < propertiesList.length; x++)
            if (favoriList[i].number == propertiesList[x].id)
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      height: 185,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 35),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PropertiesDetails(
                                                  item: propertiesList[x])));
                                },
                                child: Image.asset(
                                  propertiesList[x].pictureUrl,
                                  width: 115,
                                  height: 115,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(
                                            propertiesList[x].name,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          propertiesList[x].description,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Market İsmi:",
                                          style: TextStyle(
                                              color: Color(0xFF616161),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "Küçükler Market",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 390,
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
                                    service.deleteFavori(id: favoriList[i].id);
                                    Pservice.putProperties(
                                        name: propertiesList[x].name,
                                        price: propertiesList[x].price,
                                        pictureUrl:
                                            propertiesList[x].pictureUrl,
                                        categori: propertiesList[x].categori,
                                        description:
                                            propertiesList[x].description,
                                        isFavori: false,
                                        piece: propertiesList[x].piece,
                                        id: favoriList[i].number);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 35,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
