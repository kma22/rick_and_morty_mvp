import 'package:flutter/material.dart';

abstract class PersonageState {}

class PersonageLoadingState extends PersonageState {}

class PersonageLoadedState extends PersonageState {
  final List<dynamic> loadedPersonage;
  final int totalCount;

  PersonageLoadedState({
    @required this.loadedPersonage,
    @required this.totalCount,
  });
}

class PersonageErrorState extends PersonageState {}

class PersonageBlocNextPageState extends PersonageState {}
