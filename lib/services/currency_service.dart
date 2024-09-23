import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  static const String apiKey =
      'cur_live_nu3GGPRk4gLQVFz3iDBsWtoRmqjq4iZ4f9WuWszx';
  static const String apiUrl = 'https://api.currencyapi.com/v3/latest';

  Future<double> fetchExchangeRate() async {
    final response =
        await http.get(Uri.parse('$apiUrl?apikey=$apiKey&currencies=UAH'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']['UAH']['value'];
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
