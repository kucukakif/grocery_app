import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/favori_model.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/services/cart_service.dart';
import 'package:grocery_app/services/favori_service.dart';
import 'package:grocery_app/services/properties_service.dart';
import 'package:grocery_app/widget/dialog.dart';
import '../style/colors.dart';
import '../style/theme.dart';
import '../widget/details_widgets.dart';
import '../widget/green_button.dart';

class PropertiesDetails extends StatefulWidget {
  final Properties item;
  const PropertiesDetails({super.key, required this.item});

  @override
  State<PropertiesDetails> createState() => _PropertiesDetailsState();
}

class _PropertiesDetailsState extends State<PropertiesDetails> {
  late Properties item;
  FavoriService fService = FavoriService();
  PropertiesService PService = PropertiesService();
  CartService service = CartService();
  List<Favori> favori = [];
  List<Cart> cartList = [];
  bool isTrue = false;
  int price = 0;
  int length = 0;
  int newValue = 1;
  int amount = 1;
  @override
  void initState() {
    super.initState();
    imageCache.clear();
    item = widget.item;
    amount = item.piece;
    newValue = item.price;
    price = item.price;
    isTrue = item.isFavori;
    fService.getFavori().then((value) => setState(() {
          if (value != null) {
            favori = value;
          }
        }));
    service.getCart().then((value) => setState(() {
          if (value != null) {
            cartList = value;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        productImage(item: item.pictureUrl),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.name, style: f25w9),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (isTrue == false) {
                        isTrue = true;
                        fService.postFavori(number: item.id);
                        PService.putProperties(
                            name: item.name,
                            price: newValue,
                            pictureUrl: item.pictureUrl,
                            categori: item.categori,
                            description: item.description,
                            isFavori: isTrue,
                            piece: amount,
                            id: item.id);
                      } else if (isTrue == true) {
                        isTrue = false;
                        fService.deleteFavori(id: item.id);
                      }
                      Navigator.pop(context);
                    });
                  },
                  icon: isTrue == true
                      ? Icon(
                          Icons.favorite,
                          color: const Color(0xFF3366FF).withOpacity(0.6),
                        )
                      : const Icon(
                          Icons.favorite_outline,
                        )),
            ],
          ),
        ),
        Description(item: item.description),
        const SizedBox(
          height: 55,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (amount > 1) {
                          amount--;
                          newValue = newValue - price;
                        } else {
                          null;
                        }
                      });
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 1.3, color: const Color(0xFFE0E0E0)),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            (newAmount) {
                              newAmount = amount;
                            };
                          });
                        },
                        child: Text(amount.toString(), style: f25w9)),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        amount++;
                        newValue = newValue + price;
                      });
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 1.3, color: const Color(0xFFE0E0E0)),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text("${newValue.toString()}\$", style: f25w9),
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        list(widgett: Container(), title: "Product Details", width: 0),
        list(
            widgett: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(6)),
              alignment: Alignment.center,
              width: 55,
              height: 25,
              child: const Text(
                "100gm",
                style: TextStyle(
                    color: Color(0xFF424242), fontWeight: FontWeight.w400),
              ),
            ),
            title: "Nutritions",
            width: MediaQuery.of(context).size.width - 235),
        list(
            widgett: Container(
              width: 100,
              height: 25,
              child: Row(
                children: [icon(), icon(), icon(), icon(), icon()],
              ),
            ),
            title: "Review",
            width: MediaQuery.of(context).size.width - 250),
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: const Text(
                      'Karar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    content: const Text(
                      'Ürün sepete ekleniyor!',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Hayır',
                          style: style,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          List<bool> deger = [];
                          List<bool> deger1 = [];
                          if (cartList.isEmpty) {
                            service.postCart(
                                price: item.price,
                                piece: item.piece,
                                name: item.name,
                                number: item.id,
                                pictureUrl: item.pictureUrl,
                                description: item.description);
                          }
                          for (int i = 0; i < cartList.length; i++) {
                            if (cartList[i].name == item.name) {
                              int v = cartList[i].piece + amount;
                              int y = cartList[i].price + newValue;
                              service.putCart(
                                  price: y,
                                  piece: v,
                                  name: cartList[i].name,
                                  number: cartList[i].id,
                                  pictureUrl: cartList[i].pictureUrl,
                                  description: cartList[i].description,
                                  id: cartList[i].id);
                            }
                            if (cartList[i].name != item.name) {
                              deger = [true];
                            } else {
                              deger1 = [false];
                            }
                          }
                          if (deger.length > deger1.length) {
                            service.postCart(
                                price: newValue,
                                piece: amount,
                                name: item.name,
                                number: item.id,
                                pictureUrl: item.pictureUrl,
                                description: item.description);
                          }
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Evet',
                          style: style,
                        ),
                      )
                    ],
                  );
                });
          },
          child: const GreenButton(
            text: "Add To Basket",
            height: 55,
          ),
        )
      ]),
    );
  }
}

Icon icon() {
  return const Icon(
    Icons.star,
    color: Colors.orange,
    size: 20,
  );
}

Column list(
    {required Widget widgett, required String title, required double width}) {
  return Column(
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Divider(
          thickness: 0.8,
          color: Colors.grey,
          height: 0.8,
        ),
      ),
      Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 9, bottom: 9, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: width,
              ),
              widgett,
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 22,
                  )),
            ],
          )),
    ],
  );
}
