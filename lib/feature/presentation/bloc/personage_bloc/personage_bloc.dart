import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/domain/repositories/personage_repository.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_event.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_state.dart';


class PersonageBloc extends Bloc<PersonageEvent, PersonageState> {
  List<Personage> _loadedPersonageList = [];
  List<Personage> _newLoadedPersonageList = [];
  int page = 1;

  final PersonageRepository personageRepository ;

  PersonageBloc({@required this.personageRepository})
      : super(PersonageLoadingState()) {
    add(PersonageLoadEvent());
  }

  @override
  Stream<PersonageState> mapEventToState(PersonageEvent event) async* {

    if (event is PersonageLoadEvent) {
      yield PersonageLoadingState();
      try {
        _loadedPersonageList = await personageRepository.getPersonageList(1);
        yield PersonageLoadedState(loadedPersonage: _loadedPersonageList);
      } catch (e) {
        print(e);
        yield PersonageErrorState();
      }
    } else if( event is PersonageBlocNextPageEvent){
      yield PersonageBlocNextPageState();
      page++;
      try {
        _newLoadedPersonageList = await personageRepository.getPersonageList(page);
        _loadedPersonageList.addAll(_newLoadedPersonageList);
        yield PersonageLoadedState(loadedPersonage: _loadedPersonageList);
      } catch (e) {
        print(e);
        yield PersonageErrorState();
      }
    }
  }
}
