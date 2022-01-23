import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/domain/repositories/personage_repository.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_event.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_state.dart';

class PersonageBloc extends Bloc<PersonageEvent, PersonageState> {
  List<Personage> _loadedPersonageList = [];
  List<Personage> _newLoadedPersonageList = [];
  int _page = 1;
  String _name;
  int _totalPages;
  final PersonageRepository personageRepository;

  PersonageBloc({@required this.personageRepository})
      : super(PersonageLoadingState()) {
    add(PersonageLoadEvent());
  }

  @override
  Stream<PersonageState> mapEventToState(PersonageEvent event) async* {
    if (event is PersonageLoadEvent) {
      _name = event.name ?? '';
      _name = _name.trim() == '' ? null : _name.trim();
      yield PersonageLoadingState();
      try {
        final result =
            await personageRepository.getPersonageList(1, name: _name);
        _loadedPersonageList = result.listPersonage;
        _totalPages = result.pages;
        yield PersonageLoadedState(
          loadedPersonage: _loadedPersonageList,
          totalCount: result.count,
        );
      } catch (e) {
        yield PersonageErrorState();
      }
    } else if (event is PersonageBlocNextPageEvent) {
      if(_page < _totalPages) {
        yield PersonageBlocNextPageState();
        _page++;
        try {
          final result =
              await personageRepository.getPersonageList(_page, name: _name);
          _newLoadedPersonageList = result.listPersonage;
          _loadedPersonageList.addAll(_newLoadedPersonageList);
          yield PersonageLoadedState(
            loadedPersonage: _loadedPersonageList,
            totalCount: result.count,
          );
        } catch (e) {
          yield PersonageErrorState();
        }
      }
    }
  }
}
