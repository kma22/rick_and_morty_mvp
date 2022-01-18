import 'package:flutter/material.dart';

abstract class PersonageState {}

class PersonageLoadingState extends PersonageState {}

class PersonageLoadedState extends PersonageState {
  List<dynamic> loadedPersonage;

  PersonageLoadedState({@required this.loadedPersonage}) : assert(loadedPersonage != null);
}

class PersonageErrorState extends PersonageState {}