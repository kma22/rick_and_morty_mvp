
import 'package:flutter/material.dart';

abstract class PersonageEvent {}

class PersonageLoadEvent extends PersonageEvent{
  String name;
  PersonageLoadEvent({this.name});
}

class PersonageBlocNextPageEvent extends PersonageEvent{}
