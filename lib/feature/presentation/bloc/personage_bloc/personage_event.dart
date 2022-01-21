
import 'package:flutter/material.dart';

abstract class PersonageEvent {}

class PersonageLoadEvent extends PersonageEvent{}

class PersonageSearchEvent extends PersonageEvent{
  String text;
  PersonageSearchEvent({@required this.text});
}
class PersonageBlocNextPageEvent extends PersonageEvent{}
