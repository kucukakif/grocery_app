import 'package:flutter/material.dart';
import 'package:grocery_app/widget/favori_list_item.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FavoriListItem(),
    );
  }
}
