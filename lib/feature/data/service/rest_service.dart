import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  Future<List> getPersonage() async {
    final response =
        await http.get('https://rickandmortyapi.com/api/character');
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body['results'];
    } else {
      throw Exception('An error occurred while loading data from the server.');
    }
  }
}
