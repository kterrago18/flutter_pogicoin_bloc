import 'package:http/http.dart' as http;

import '../../constants/strings.dart';

class CoinApi {
  Future<http.Response> loadCoins() async {
    final uriParsed = Uri.parse('${Strings.baseApiUrl}/ticker');

    final response = await http.get(uriParsed);

    return response;
  }

  Future<http.Response> loadCoinDetails(String coinId) async {
    final uriParsed =
        Uri.parse('${Strings.baseApiUrl}/coins/$coinId/ohlcv/today');

    print('## $uriParsed');

    final response = await http.get(uriParsed);

    return response;
  }
}
