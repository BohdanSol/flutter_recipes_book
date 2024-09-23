import 'dart:convert';
import 'package:http/http.dart' as http;

class CatFactService {
  Future<String> fetchCatFact() async {
    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['fact'];
    } else {
      throw Exception('Failed to load fact');
    }
  }
}
