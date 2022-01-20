import 'package:rick_and_morty_mvp/feature/data/mapper/personage_mapper.dart';
import 'package:rick_and_morty_mvp/feature/data/models/api_personage.dart';
import 'package:rick_and_morty_mvp/feature/data/service/rest_service.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/domain/repositories/personage_repository.dart';

class PersonageDataRepository implements PersonageRepository {
  final RestService _restService;

  PersonageDataRepository(this._restService);

  @override
  Future<List<Personage>> getPersonageList() async {
    final result = await _restService.getPersonage();
    List<Personage> personageList = [];
    for (var map in result) {
      personageList.add(PersonageMapper.fromApi(ApiPersonage.fromMap(map)));
    }
    return personageList;
  }
}
