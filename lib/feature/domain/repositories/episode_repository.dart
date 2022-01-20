
import 'package:rick_and_morty_mvp/feature/domain/models/episode.dart';

abstract class EpisodeRepository {
  Future<Episode> getEpisodeList(String url);
}