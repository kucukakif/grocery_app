import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'account_page.dart';
import 'cart_page.dart';
import 'explore_page.dart';
import 'favourite_page.dart';
import 'home_page.dart';
import '../style/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List pages = [
    const ShopPage(),
    const ExplorePage(),
    const CartPage(),
    const FavouritePage(),
    const AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _bottomNavBar(),
        body: Stack(
          children: [
            pages.elementAt(_currentIndex),
          ],
        ));
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      elevation: 105,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: AppColors.primaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/shop_icon.svg",
            color: Colors.black,
          ),
          activeIcon: SvgPicture.asset(
            "assets/icons/shop_icon.svg",
            color: AppColors.primaryColor,
          ),
          label: "Shop",
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/explore_icon.svg",
              color: Colors.black,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/explore_icon.svg",
              color: AppColors.primaryColor,
            ),
            label: "Explore"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/cart_icon.svg",
              color: Colors.black,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/cart_icon.svg",
              color: AppColors.primaryColor,
            ),
            label: "Cart"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/favourite_icon.svg",
              color: Colors.black,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/favourite_icon.svg",
              color: AppColors.primaryColor,
            ),
            label: "Favourite"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/account_icon.svg",
              color: Colors.black,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/account_icon.svg",
              color: AppColors.primaryColor,
            ),
            label: "Account"),
      ],
      selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
      selectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
    );
  }
}
