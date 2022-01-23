import 'package:rick_and_morty_mvp/feature/data/mapper/personage_mapper.dart';
import 'package:rick_and_morty_mvp/feature/data/models/api_personage.dart';
import 'package:rick_and_morty_mvp/feature/data/models/api_personage_search_result.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage_search_result.dart';

class PersonageSearchResultMapper {
  static PersonageSearchResult fromApi(ApiPersonageSearchResult apiModel) {
    List<Personage> personageList = [];
    for (var map in apiModel.personageList) {
      personageList.add(PersonageMapper.fromApi(ApiPersonage.fromMap(map)));
    }
    return PersonageSearchResult(
      count: apiModel.count,
      pages: apiModel.pages,
      listPersonage: personageList,
    );
  }
}
