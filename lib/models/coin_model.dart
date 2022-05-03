// To parse this JSON data, do
//
//     final coin = coinFromJson(jsonString);

import 'dart:convert';

List<Coin> coinFromJson(String str) =>
    List<Coin>.from(json.decode(str).map((x) => Coin.fromJson(x)));

String coinToJson(List<Coin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coin {
  Coin({
    this.id,
    this.name,
    this.symbol,
    this.rank,
    this.isNew,
    this.isActive,
    this.type,
  });

  String? id;
  String? name;
  String? symbol;
  int? rank;
  bool? isNew;
  bool? isActive;
  String? type;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        rank: json["rank"],
        isNew: json["is_new"],
        isActive: json["is_active"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "rank": rank,
        "is_new": isNew,
        "is_active": isActive,
        "type": type,
      };
}
