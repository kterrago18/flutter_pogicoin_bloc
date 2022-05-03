import 'dart:io';

import 'package:flutter_pogicoin_bloc/data/network/coin_api.dart';

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
}
