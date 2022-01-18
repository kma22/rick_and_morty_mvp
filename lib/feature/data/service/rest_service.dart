import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  Future<List> getPersonage() async {
    final responsePersonage =
        await http.get('https://rickandmortyapi.com/api/character');
    if (responsePersonage.statusCode == 200) {
      final body = json.decode(responsePersonage.body);
      return body['results'];
    } else {
      throw Exception(
          'An error occurred while loading character data from the server.');
    }
  }
}
