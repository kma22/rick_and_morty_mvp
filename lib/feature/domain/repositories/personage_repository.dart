import 'package:rick_and_morty_mvp/feature/domain/models/personage_search_result.dart';

abstract class PersonageRepository {
  Future<PersonageSearchResult> getPersonageList(int page, {String name});
}