// To parse this JSON data, do
//
//     final coinDetails = coinDetailsFromJson(jsonString);

import 'dart:convert';

List<CoinDetails> coinDetailsFromJson(String str) => List<CoinDetails>.from(
    json.decode(str).map((x) => CoinDetails.fromJson(x)));

String coinDetailsToJson(List<CoinDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoinDetails {
  CoinDetails({
    this.timeOpen,
    this.timeClose,
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
    this.marketCap,
  });

  DateTime? timeOpen;
  DateTime? timeClose;
  double? open;
  double? high;
  double? low;
  double? close;
  int? volume;
  int? marketCap;

  factory CoinDetails.fromJson(Map<String, dynamic> json) => CoinDetails(
        timeOpen: DateTime.parse(json["time_open"]),
        timeClose: DateTime.parse(json["time_close"]),
        open: json["open"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        close: json["close"].toDouble(),
        volume: json["volume"],
        marketCap: json["market_cap"],
      );

  Map<String, dynamic> toJson() => {
        "time_open": timeOpen?.toIso8601String(),
        "time_close": timeClose?.toIso8601String(),
        "open": open,
        "high": high,
        "low": low,
        "close": close,
        "volume": volume,
        "market_cap": marketCap,
      };
}
