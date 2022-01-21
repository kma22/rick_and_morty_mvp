import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_mvp/feature/data/repository/personage_data_repository.dart';
import 'package:rick_and_morty_mvp/feature/data/service/rest_service.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_bloc.dart';
import 'package:rick_and_morty_mvp/feature/presentation/widgets/main_appbar.dart';
import 'package:rick_and_morty_mvp/feature/presentation/widgets/personage_list.dart';

class HomePage extends StatelessWidget {

  final personageRepository = PersonageDataRepository(RestService());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PersonageBloc(personageRepository: personageRepository),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MainAppBar(),
              Expanded(child: PersonageList()),
            ],
          ),
        ),
      ),
    );
  }
}
