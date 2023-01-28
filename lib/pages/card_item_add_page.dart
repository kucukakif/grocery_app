import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grocery_app/services/properties_service.dart';
import 'package:grocery_app/widget/green_button.dart';
import 'package:image_picker/image_picker.dart';

class CardItemAddPage extends StatelessWidget {
  const CardItemAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CardItemAdd();
  }
}

class CardItemAdd extends StatefulWidget {
  const CardItemAdd({super.key});

  @override
  State<CardItemAdd> createState() => _CardItemAddState();
}

class _CardItemAddState extends State<CardItemAdd> {
  PropertiesService service = PropertiesService();
  TextEditingController productController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  File? _secilenDosya;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            const SizedBox(
              height: 65,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: const Color(0xFFD6D6D6),
                backgroundImage:
                    _secilenDosya != null ? FileImage(_secilenDosya!) : null,
                radius: 100,
                child: _secilenDosya == null
                    ? IconButton(
                        onPressed: () {
                          _secimFotoGoster(context);
                        },
                        icon: const Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 35,
                        ))
                    : null,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _textField(
                name: "Product Name",
                controller: productController,
                maxLength: 15),
            _textField(
                name: "Description",
                controller: descriptionController,
                maxLength: 5),
            _textField(
                name: "Price", controller: priceController, maxLength: 3),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: InkWell(
                  onTap: () {
                    service.postProperties(
                      name: productController.text,
                      price: int.parse(priceController.text),
                      pictureUrl: _secilenDosya!.path.toString(),
                      categori: 6,
                      description: descriptionController.text,
                      isFavori: false,
                      piece: 1,
                    );
                    Navigator.pop(context);
                  },
                  child: const GreenButton(
                    text: "Kaydet",
                    height: 55,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Padding _textField(
      {required String name,
      required TextEditingController? controller,
      required int maxLength}) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: TextField(
        maxLength: maxLength,
        controller: controller,
        decoration: InputDecoration(
            labelText: name,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
      ),
    );
  }

  void _secimFotoGoster(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Galeriden Fotoğraf Seç"),
                    onTap: () {
                      _secimYukle(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    title: const Text("Kameradan Fotoğraf Çek"),
                    onTap: () {
                      _secimYukle(ImageSource.camera);
                    },
                  ),
                ],
              ),
            ));
  }

  void _secimYukle(ImageSource source) async {
    final picker = ImagePicker();
    final secilen = await picker.getImage(source: source);
    setState(() {
      if (secilen != null) {
        _secilenDosya = File(secilen.path);
      }
    });
    Navigator.pop(context);
  }
}
