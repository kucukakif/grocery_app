import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import '../models/properties_model.dart';

class PropertiesService {
  final String url = "https://10.0.2.2:7272/api/Product";
  Future<List<Properties>?> getProperties() async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      try {
        return propertiesFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Properties>?> postProperties(
      {required String name,
      required int price,
      required String pictureUrl,
      required int categori,
      required String description,
      required bool isFavori,
      required int piece}) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "name": name,
        "price": price,
        "pictureUrl": pictureUrl,
        'categori': categori,
        'description': description,
        'isFavori': isFavori,
        'piece': piece
      }),
    );
    if (res.statusCode == 200) {
      try {
        return propertiesFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Properties>?> deleteProperties({required int id}) async {
    String url = "https://10.0.2.2:7272/api/Product/$id";
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var res = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      try {
        return propertiesFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Properties>?> putProperties(
      {required String name,
      required int price,
      required String pictureUrl,
      required int categori,
      required String description,
      required bool isFavori,
      required int piece,
      required int id}) async {
    String url = "https://10.0.2.2:7272/api/Product/$id";
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
        "price": price,
        "pictureUrl": pictureUrl,
        "categori": categori,
        "description": description,
        "isFavori": isFavori,
        "piece": piece
      }),
    );
    if (res.statusCode == 200) {
      try {
        return propertiesFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }
}
