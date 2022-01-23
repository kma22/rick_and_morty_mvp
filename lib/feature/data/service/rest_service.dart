import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  Future<Map> getPersonage(int page, {String name}) async {
    String url = 'https://rickandmortyapi.com/api/character/?page=${page}';
    if (name != null) {
      url += '&name=$name';
    }
    final responsePersonage = await http.get(url);
    if (responsePersonage.statusCode == 200) {
      final body = json.decode(responsePersonage.body);
      return body;
    } else {
      throw Exception(
          'An error occurred while loading character data from the server.');
    }
  }

  Future<Map> getEpisode(String url) async {
    final responseEpisode = await http.get(url);
    if (responseEpisode.statusCode == 200) {
      final body = json.decode(responseEpisode.body);
      return body;
    } else {
      throw Exception(
          'An error occurred while downloading episode data from the server.');
    }
  }
}
