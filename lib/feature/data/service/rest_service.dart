import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_mvp/feature/domain/models/episode.dart';

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
