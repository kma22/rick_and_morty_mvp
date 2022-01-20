import 'package:rick_and_morty_mvp/feature/data/mapper/episode_mapper.dart';
import 'package:rick_and_morty_mvp/feature/data/models/api_episode.dart';
import 'package:rick_and_morty_mvp/feature/data/service/rest_service.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/episode.dart';
import 'package:rick_and_morty_mvp/feature/domain/repositories/episode_repository.dart';

class EpisodeDataRepository implements EpisodeRepository{
  final RestService _restService;

  EpisodeDataRepository(this._restService);

  @override
  Future<Episode> getEpisodeList(String url) async {
    final result = await _restService.getEpisode(url);
    Episode episode = EpisodeMapper.fromApi(ApiEpisode.fromMap(result));

    return episode;
  }


}