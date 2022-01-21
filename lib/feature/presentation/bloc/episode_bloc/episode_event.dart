import 'package:flutter/cupertino.dart';

abstract class EpisodeEvent {}

class EpisodeLoadEvent extends EpisodeEvent {
  final List<String> url;

  EpisodeLoadEvent({@required this.url});
}

class EpisodeBlocNextPageEvent extends EpisodeEvent{}
