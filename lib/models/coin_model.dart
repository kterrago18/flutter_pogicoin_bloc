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
    this.priceUsd,
    this.priceBtc,
    this.volume24HUsd,
    this.marketCapUsd,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.lastUpdated,
  });

  String? id;
  String? name;
  String? symbol;
  String? rank;
  String? priceUsd;
  String? priceBtc;
  String? volume24HUsd;
  String? marketCapUsd;
  String? circulatingSupply;
  String? totalSupply;
  String? maxSupply;
  String? percentChange1H;
  String? percentChange24H;
  String? percentChange7D;
  String? lastUpdated;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        rank: json["rank"],
        priceUsd: json["price_usd"],
        priceBtc: json["price_btc"],
        volume24HUsd: json["volume_24h_usd"],
        marketCapUsd: json["market_cap_usd"],
        circulatingSupply: json["circulating_supply"],
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        percentChange1H: json["percent_change_1h"],
        percentChange24H: json["percent_change_24h"],
        percentChange7D: json["percent_change_7d"],
        lastUpdated: json["last_updated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "rank": rank,
        "price_usd": priceUsd,
        "price_btc": priceBtc,
        "volume_24h_usd": volume24HUsd,
        "market_cap_usd": marketCapUsd,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "last_updated": lastUpdated,
      };
}
