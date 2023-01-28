import 'dart:convert';
import 'dart:io';
import 'package:grocery_app/models/favori_model.dart';
import 'package:grocery_app/models/properties_model.dart';
import 'package:grocery_app/services/properties_service.dart';
import 'package:http/io_client.dart';

class FavoriService {
  final String url = "https://10.0.2.2:7272/api/Favori";
  Future<List<Favori>?> getFavori() async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      try {
        return favoriFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  PropertiesService service = PropertiesService();
  Properties? propertie;

  Future<List<Favori>?> postFavori({required int number}) async {
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
        "number": number,
      }),
    );
    if (res.statusCode == 200) {
      try {
        return favoriFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Favori>?> deleteFavori({required int id}) async {
    String url = "https://10.0.2.2:7272/api/Favori?id=$id";
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
        return favoriFromJson(res.body);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }
}
