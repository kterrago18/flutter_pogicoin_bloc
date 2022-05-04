import 'dart:io';

import 'package:flutter_pogicoin_bloc/data/network/coin_api.dart';
import 'package:flutter_pogicoin_bloc/models/coin_details_model.dart';

import '../../models/coin_model.dart';

class CoinRepository {
  final _coinApi = CoinApi();

  Future<List<Coin>> loadCoins() async {
    List<Coin> coinList = [];

    try {
      final response = await _coinApi.loadCoins();

      if (response.statusCode == 200) {
        coinList = coinFromJson(response.body);
      }

      return coinList;
    } catch (e) {
      rethrow;
    }
  }

  Future<CoinDetails?> loadCoinDetails(String coinId) async {
    CoinDetails? coinDetails;
    try {
      final response = await _coinApi.loadCoinDetails(coinId);

      if (response.statusCode == 200) {
        coinDetails = coinDetailsFromJson(response.body)[0];
      } else {
        coinDetails = null;
      }

      return coinDetails;
    } catch (e) {
      rethrow;
    }
  }
}
