import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import 'package:rick_and_morty_mvp/feature/data/repository/episode_data_repository.dart';
import 'package:rick_and_morty_mvp/feature/data/service/rest_service.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_bloc.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_event.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_state.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';
import 'package:rick_and_morty_mvp/feature/presentation/widgets/info_episode.dart';

class InfoPersonagePage extends StatefulWidget {
  final Personage personage;

  const InfoPersonagePage({Key key, @required this.personage}) : super(key: key);

  @override
  State<InfoPersonagePage> createState() => _InfoPersonagePageState();
}

class _InfoPersonagePageState extends State<InfoPersonagePage> {
  final EpisodeBloc _bloc =
      EpisodeBloc(episodeRepository: EpisodeDataRepository(RestService()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rick and Morty (MVP)'),
          backgroundColor: Colors.white12,
        ),
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
              colors: [Colors.black, Colors.grey],
            ),
          ),
          child: BlocBuilder(
              buildWhen: (_, state) => state is EpisodeLoadedState,
              cubit: _bloc,
              builder: (context, state) {
                bool isFinish = false;
                if (state is EpisodeLoadedState) {
                  isFinish =
                      state.episodes.length == widget.personage.episode.length;
                }
                return LoadMore(
                  isFinish: isFinish,
                  onLoadMore: () async {
                    _bloc.add(EpisodeBlocNextPageEvent());
                    await Future.delayed(const Duration(seconds: 1));
                    return true;
                  },
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              widget.personage.image,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.personage.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: ColorsStyles.textHeaderWhite70,
                              fontSize: 44,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 17,
                              color: widget.personage.status == 'Alive'
                                  ? Colors.green
                                  : widget.personage.status == 'unknown'
                                      ? Colors.yellow
                                      : Colors.red,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${widget.personage.status} - ${widget.personage.species}',
                              style: const TextStyle(
                                color: ColorsStyles.textHeaderWhite70,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...buildText('Gender: ', widget.personage.gender),
                              const SizedBox(height: 5),
                              ...buildText('Type: ', widget.personage.type),
                              const SizedBox(height: 5),
                              ...buildText('Origin: ', widget.personage.origin),
                              const SizedBox(height: 5),
                              ...buildText('Last known location: ',
                                  widget.personage.location),
                              const SizedBox(height: 5),
                              ...buildText('Date of creation: ',
                                  DateTransformation(widget.personage.created)),
                              const SizedBox(height: 5),
                              const Text(
                                'The character is found in:',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 25),
                              BlocProvider(
                                  create: (_) => _bloc,
                                  child: InfoEpisode(
                                      url: widget.personage.episode)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String valu) {
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 21,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Text(
              valu,
              //DateTransformation(personage.created),
              style: const TextStyle(
                color: ColorsStyles.textInfoPersonageWhite54,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  String DateTransformation(DateTime date) {
    String result;
    switch (date.month) {
      case 1:
        result = 'January ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 2:
        result = 'February ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 3:
        result = 'March ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 4:
        result = 'April ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 5:
        result = 'May ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 6:
        result = 'June ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 7:
        result = 'July ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 8:
        result = 'August ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 9:
        result = 'September ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 10:
        result = 'October ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 11:
        result = 'November ${date.day.toString()}, ${date.year.toString()}';
        break;
      case 12:
        result = 'December ${date.day.toString()}, ${date.year.toString()}';
        break;
    }
    return result;
  }
}

List<Widget> buildText(String text, String valu) {
  return [
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: Text(
            valu,
            //DateTransformation(personage.created),
            style: const TextStyle(
              color: ColorsStyles.textInfoPersonageWhite54,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  ];
}
