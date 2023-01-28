import 'dart:convert';

List<Favori> favoriFromJson(String str) =>
    List<Favori>.from(json.decode(str).map((x) => Favori.fromJson(x)));

String favoriToJson(Favori data) => json.encode(data.toJson());

class Favori {
  Favori({
    required this.id,
    required this.number,
  });

  int id;
  int number;

  factory Favori.fromJson(Map<String, dynamic> json) => Favori(
        id: json["id"] == null ? null : json["id"],
        number: json["number"] == null ? null : json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "number": number == null ? null : number,
      };
}
