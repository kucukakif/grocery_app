import 'package:grocery_app/models/properties_model.dart';

class AccountData {
  final String picture;
  final String title;

  AccountData({
    required this.picture,
    required this.title,
  });
}

var account_items = [
  AccountData(
      picture: "assets/icons/account_icons/orders_icon.svg", title: "Orders"),
  AccountData(
      picture: "assets/icons/account_icons/details_icon.svg",
      title: "My Details"),
  AccountData(
      picture: "assets/icons/account_icons/delivery_icon.svg",
      title: "Delivery Access"),
  AccountData(
      picture: "assets/icons/account_icons/payment_icon.svg",
      title: "Payment Methods"),
  AccountData(
      picture: "assets/icons/account_icons/promo_icon.svg",
      title: "Promo Card"),
  AccountData(
      picture: "assets/icons/account_icons/notification_icon.svg",
      title: "Notification"),
  AccountData(
      picture: "assets/icons/account_icons/help_icon.svg", title: "Help"),
  AccountData(
      picture: "assets/icons/account_icons/about_icon.svg", title: "About"),
];
var beverage_items = [
  Properties(
      id: 1,
      name: "Dite Coke",
      price: 2,
      pictureUrl: "assets/images/beverages_images/diet_coke.png",
      categori: 6,
      description: "355ml, Price",
      isFavori: false,
      piece: 1),
  Properties(
      id: 2,
      name: "Sprite Can",
      price: 2,
      pictureUrl: "assets/images/beverages_images/sprite.png",
      categori: 6,
      description: "325ml, Price",
      isFavori: false,
      piece: 1),
  Properties(
      id: 3,
      name: "Apple Juice",
      price: 16,
      pictureUrl: "assets/images/beverages_images/apple_and_grape_juice.png",
      categori: 6,
      description: "2L, Price",
      isFavori: false,
      piece: 1),
  Properties(
      id: 4,
      name: "Orange Juice",
      price: 16,
      pictureUrl: "assets/images/beverages_images/orange_juice.png",
      categori: 6,
      description: "2L, Price",
      isFavori: false,
      piece: 1),
  Properties(
      id: 5,
      name: "Coca Cola Can",
      price: 5,
      pictureUrl: "assets/images/beverages_images/coca_cola.png",
      categori: 6,
      description: "325ml, Price",
      isFavori: false,
      piece: 1),
  Properties(
      id: 6,
      name: "Pepsi Can",
      price: 5,
      pictureUrl: "assets/images/beverages_images/pepsi.png",
      categori: 6,
      description: "330ml, Price",
      isFavori: false,
      piece: 1),
];

var home_page_items = [
  Properties(
      id: 7,
      name: "Beef",
      price: 25,
      pictureUrl: "assets/images/grocery_images/beef.png",
      categori: 1,
      description: "250gr, Priceg",
      isFavori: false,
      piece: 1),
  Properties(
      id: 8,
      name: "Chicken",
      price: 20,
      pictureUrl: "assets/images/grocery_images/chicken.png",
      categori: 1,
      description: "250gr, Priceg",
      isFavori: false,
      piece: 1),
  Properties(
      id: 9,
      name: "Ginger",
      price: 6,
      pictureUrl: "assets/images/grocery_images/ginger.png",
      categori: 1,
      description: "250gr, Priceg",
      isFavori: false,
      piece: 1),
  Properties(
      id: 10,
      name: "Pepper",
      price: 6,
      pictureUrl: "assets/images/grocery_images/pepper.png",
      categori: 1,
      description: "250gr, Priceg",
      isFavori: false,
      piece: 1),
  Properties(
      id: 11,
      name: "Banana",
      price: 5,
      pictureUrl: "assets/images/grocery_images/banana.png",
      categori: 1,
      description: "1kg, Priceg",
      isFavori: false,
      piece: 1),
  Properties(
      id: 12,
      name: "Apple",
      price: 5,
      pictureUrl: "assets/images/grocery_images/apple.png",
      categori: 1,
      description: "1kg, Priceg",
      isFavori: false,
      piece: 1),
];
