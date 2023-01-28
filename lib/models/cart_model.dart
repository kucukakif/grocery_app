import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart(
      {required this.id,
      required this.name,
      required this.price,
      required this.piece,
      required this.number,
      required this.description,
      required this.pictureUrl});

  int id;
  String name;
  int price;
  int piece;
  int number;
  String pictureUrl;
  String description;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"] == null ? null : json["id"],
        price: json["price"] == null ? null : json["price"],
        piece: json["piece"] == null ? null : json["piece"],
        name: json["name"] == null ? null : json["name"],
        pictureUrl: json["pictureUrl"] == null ? null : json["pictureUrl"],
        description: json["description"] == null ? null : json["description"],
        number: json["number"] == null ? null : json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "price": price == null ? null : price,
        "piece": piece == null ? null : piece,
        "name": name == null ? null : name,
        "pictureUrl": pictureUrl == null ? null : pictureUrl,
        "description": description == null ? null : description,
        "number": number == null ? null : number,
      };
}
