import 'package:rick_and_morty_mvp/feature/data/models/api_episode.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/episode.dart';

class EpisodeMapper {
  static Episode fromApi(ApiEpisode apiModel) {
    return Episode(
      name: apiModel.name,
      airData: apiModel.airData,
      episode: apiModel.episode,
    );
  }
}
