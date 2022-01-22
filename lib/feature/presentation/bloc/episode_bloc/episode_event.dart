import 'package:flutter/cupertino.dart';

abstract class EpisodeEvent {}

class EpisodeLoadEvent extends EpisodeEvent {
  final List<String> url;
  final String name;

  EpisodeLoadEvent({@required this.url, this.name});
}

class EpisodeBlocNextPageEvent extends EpisodeEvent{}
