import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';

class ApiPersonageSearchResult {
  final int count;
  final int pages;
  final List personageList;

  ApiPersonageSearchResult.fromMap(Map<String, dynamic> map):
    count = map['info']['count'],
    pages = map['info']['count'],
    personageList = map['results'];
}
