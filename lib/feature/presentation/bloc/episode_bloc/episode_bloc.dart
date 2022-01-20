import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/episode.dart';
import 'package:rick_and_morty_mvp/feature/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_event.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {

  final EpisodeRepository episodeRepository;

  EpisodeBloc({@required this.episodeRepository })
      : super(EpisodeLoadingState());

  @override
  Stream<EpisodeState> mapEventToState(EpisodeEvent event) async* {
    if(event is EpisodeLoadEvent){
      List<Episode> _listEpisode = [];
      List<String> urlList = event.url;
      yield EpisodeLoadingState();
      try{
        for(var url in urlList){
          _listEpisode.add(await episodeRepository.getEpisodeList(url));
        }
        yield EpisodeLoadedState(episodes: _listEpisode);
      } catch(e){
        print(e);
        yield EpisodeErrorState();
      }
    }
  }
}
