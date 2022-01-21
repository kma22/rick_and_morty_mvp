import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_mvp/feature/data/repository/episode_data_repository.dart';
import 'package:rick_and_morty_mvp/feature/data/service/rest_service.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_bloc.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_event.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/episode_bloc/episode_state.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';

class InfoEpisode extends StatefulWidget {
  final List<String> url;

  const InfoEpisode({Key key, @required this.url}) : super(key: key);

  @override
  State<InfoEpisode> createState() => _InfoEpisodeState();
}

class _InfoEpisodeState extends State<InfoEpisode> {
  EpisodeBloc bloc = EpisodeBloc(episodeRepository: EpisodeDataRepository(RestService()));

  @override
  void initState() {
    bloc.add(EpisodeLoadEvent(url: widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: bloc,
        builder: (context, state) {
          if (state is EpisodeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EpisodeLoadedState) {
            if (state.episodes.isEmpty) {
              return const Center(
                child: Text('The data is not loaded. Press button "Load".'),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  state.episodes.length,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Episode: ',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            state.episodes[index].episode,
                            style: const TextStyle(
                              color: ColorsStyles.textInfoPersonageWhite54,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name episode: ',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.episodes[index].name,
                              style: const TextStyle(
                                color: ColorsStyles.textInfoPersonageWhite54,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Release date: ',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.episodes[index].airData,
                              style: const TextStyle(
                                color: ColorsStyles.textInfoPersonageWhite54,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              );
            }
          }
        });
  }
}
