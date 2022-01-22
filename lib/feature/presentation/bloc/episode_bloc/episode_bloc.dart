import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/episode.dart';
import 'package:rick_and_morty_mvp/feature/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_event.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  List<Episode> _listEpisode = [];
  List<Episode> _newListEpisode = [];
  List<String> urlList = [];
  int startListUrl = 0;
  int endListUrl = 1;
  final EpisodeRepository episodeRepository;

  EpisodeBloc({@required this.episodeRepository})
      : super(EpisodeLoadingState());

  @override
  Stream<EpisodeState> mapEventToState(EpisodeEvent event) async* {
    if (event is EpisodeLoadEvent) {
      urlList = event.url;

      yield EpisodeLoadingState();
      try {
        //TODO до делать динамическую загрузку списка эпизодов
        for (startListUrl; startListUrl < endListUrl; startListUrl++) {
          _listEpisode.add(
              await episodeRepository.getEpisodeList(urlList[startListUrl]));
        }
        yield EpisodeLoadedState(episodes: _listEpisode);
      } catch (e) {
        print(e);
        yield EpisodeErrorState();
      }
    } else if (event is EpisodeBlocNextPageEvent) {
      _newListEpisode = [];
      startListUrl = endListUrl;
      endListUrl += 2;
      if (endListUrl > urlList.length) {
        endListUrl = urlList.length;
      }
      yield EpisodeBlocNextPageState();
      try {
        for (startListUrl; startListUrl < endListUrl; startListUrl++) {
          _newListEpisode.add(
              await episodeRepository.getEpisodeList(urlList[startListUrl]));
        }
        _listEpisode.addAll(_newListEpisode);
        yield EpisodeLoadedState(episodes: _listEpisode);
      } catch (e) {
        print(e);
        yield EpisodeErrorState();
      }
    }
  }
}
