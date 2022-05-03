import 'package:http/http.dart' as http;

import '../../constants/strings.dart';

class CoinApi {
  Future<http.Response> loadCoins() async {
    final uriParsed = Uri.parse('${Strings.baseApiUrl}/ticker');

    final response = await http.get(uriParsed);

    return response;
  }
}
