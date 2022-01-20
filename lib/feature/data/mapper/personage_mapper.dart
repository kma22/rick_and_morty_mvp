import 'package:rick_and_morty_mvp/feature/data/models/api_personage.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';

class PersonageMapper {
  static Personage fromApi(ApiPersonage apiModel) {
    return Personage(
      id: apiModel.id,
      name: apiModel.name,
      status: apiModel.status,
      species: apiModel.species,
      origin: apiModel.origin,
      location: apiModel.location,
      image: apiModel.image,
      gender: apiModel.gender,
      type:  apiModel.type,
      episode: List<String>.from(apiModel.episode),
      created: DateTime.parse(apiModel.created as String),
    );
  }
}
