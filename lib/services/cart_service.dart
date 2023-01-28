import 'dart:convert';
import 'dart:io';

import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/services/properties_service.dart';
import 'package:http/io_client.dart';

class CartService {
  final String url = "https://10.0.2.2:7272/api/Cart";
  Future<List<Cart>?> getCart() async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      try {
        return cartFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  PropertiesService service = PropertiesService();
  Properties? propertie;

  Future<List<Cart>?> postCart(
      {required int price,
      required int piece,
      required String name,
      required int number,
      required String pictureUrl,
      required String description}) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    await service.getProperties().then((value) {
      for (int i = 0; i < value!.length; i++) {
        propertie = value[i];
      }
    });
    var res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "name": name,
        "number": number,
        "price": price,
        "piece": piece,
        "pictureUrl": pictureUrl,
        "description": description,
      }),
    );
    if (res.statusCode == 200) {
      try {
        return cartFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Cart>?> deleteCart({required int id}) async {
    String url = "https://10.0.2.2:7272/api/Cart?id=$id";
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var res = await http.delete(
      Uri.parse(url),
    );
    if (res.statusCode == 200) {
      try {
        return cartFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Cart>?> putCart(
      {required int price,
      required int piece,
      required String name,
      required int number,
      required String pictureUrl,
      required String description,
      required int id}) async {
    String url = "https://10.0.2.2:7272/api/Cart?id=$id";
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var res = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "name": name,
        "number": number,
        "price": price,
        "piece": piece,
        "pictureUrl": pictureUrl,
        "description": description,
      }),
    );
    if (res.statusCode == 200) {
      try {
        return cartFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }
}
