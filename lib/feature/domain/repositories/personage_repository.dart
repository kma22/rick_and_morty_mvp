import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';

abstract class PersonageRepository {
  Future<List<Personage>> getPersonageList(int page, {String name});
}