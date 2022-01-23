import 'package:rick_and_morty_mvp/feature/data/mapper/personage_mapper.dart';
import 'package:rick_and_morty_mvp/feature/data/mapper/personage_search_results_mapper.dart';
import 'package:rick_and_morty_mvp/feature/data/models/api_personage.dart';
import 'package:rick_and_morty_mvp/feature/data/models/api_personage_search_result.dart';
import 'package:rick_and_morty_mvp/feature/data/service/rest_service.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage_search_result.dart';
import 'package:rick_and_morty_mvp/feature/domain/repositories/personage_repository.dart';

class PersonageDataRepository implements PersonageRepository {
  final RestService _restService;

  PersonageDataRepository(this._restService);

  @override
  Future<PersonageSearchResult> getPersonageList(int page, {String name}) async {
    final result = await _restService.getPersonage(page, name: name);

    return PersonageSearchResultMapper.fromApi(ApiPersonageSearchResult.fromMap(result));
  }
}
