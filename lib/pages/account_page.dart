import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/models/account_data.dart';
import 'package:grocery_app/pages/first_page.dart';

import '../style/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const ListTile(
            leading: SizedBox(
              height: 65,
              width: 65,
              child: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/account_image.jpg")),
            ),
            title: Text(
              "Akif Emre Küçük",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
            ),
            subtitle: Text(
              "github.com/kucukakif",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(
            color: Color(0xFF303030),
            thickness: 0.7,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 320,
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            ListTile(
                              leading: SvgPicture.asset(
                                  account_items[index].picture),
                              title: Text(
                                account_items[index].title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Color(0xFF757575),
                        thickness: 0.7,
                      )
                    ],
                  );
                },
                itemCount: account_items.length),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    SvgPicture.asset(
                        "assets/icons/account_icons/logout_icon.svg"),
                    const SizedBox(
                      width: 110,
                    ),
                    const Text(
                      "Log Out",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 21,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
