import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/episode.dart';

abstract class EpisodeState {}

class EpisodeLoadingState extends EpisodeState {}

class EpisodeLoadedState extends EpisodeState {
  List<Episode> episodes;

  EpisodeLoadedState({@required this.episodes});
}

class EpisodeErrorState extends EpisodeState {}

class EpisodeBlocNextPageState extends EpisodeState {}
