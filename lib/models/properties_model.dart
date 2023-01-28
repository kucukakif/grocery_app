import 'dart:convert';

List<Properties> propertiesFromJson(String str) =>
    List<Properties>.from(json.decode(str).map((x) => Properties.fromJson(x)));

String propertiesToJson(Properties data) => json.encode(data.toJson());

class Properties {
  Properties(
      {required this.id,
      required this.name,
      required this.price,
      required this.pictureUrl,
      required this.categori,
      required this.description,
      required this.isFavori,
      required this.piece});

  int id;
  String name;
  int price;
  String pictureUrl;
  int categori;
  String description;
  bool isFavori;
  int piece;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        pictureUrl: json["pictureUrl"] == null ? null : json["pictureUrl"],
        categori: json["categori"] == null ? null : json["categori"],
        description: json["description"] == null ? null : json["description"],
        isFavori: json["isFavori"] == null ? null : json["isFavori"],
        piece: json["piece"] == null ? null : json["piece"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "pictureUrl": pictureUrl == null ? null : pictureUrl,
        "categori": categori == null ? null : categori,
        "description": description == null ? null : description,
        "isFavori": isFavori == null ? null : isFavori,
        "piece": piece == null ? null : piece,
      };
}
