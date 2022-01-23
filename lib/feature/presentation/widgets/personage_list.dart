import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_bloc.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_event.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_state.dart';
import 'package:rick_and_morty_mvp/feature/presentation/pages/info_personage_page.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';

class PersonageList extends StatefulWidget {
  PersonageList({Key key}) : super(key: key);

  @override
  State<PersonageList> createState() => _PersonageListState();
}

class _PersonageListState extends State<PersonageList> {
  PersonageBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: _bloc,
        buildWhen: (_, state) => state is! PersonageBlocNextPageState,
        builder: (context, state) {
          if (state is PersonageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PersonageLoadedState) {
            if (state.loadedPersonage.isEmpty) {
              return const Center(
                child: Text('The data is not loaded. Press button "Load".'),
              );
            } else {
              return LoadMore(
                isFinish: state.loadedPersonage.length >= state.totalCount,
                onLoadMore: () async {
                  _bloc.add(PersonageBlocNextPageEvent());
                  await Future.delayed(Duration(seconds: 1));
                  return true;
                },
                child: ListView.builder(
                  itemCount: state.loadedPersonage.length,
                  itemBuilder: (context, index) => CardInfoPersonage(
                      personage: state.loadedPersonage[index]),
                ),
              );
            }
          }
          return const SizedBox();
        });
  }
}

class CardInfoPersonage extends StatelessWidget {
  final Personage personage;

  const CardInfoPersonage({Key key, @required this.personage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white24,
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => InfoPersonagePage(personage: personage),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                personage.image,
                width: 155,
                height: 155,
                loadingBuilder: (context, child, progress) => progress == null
                    ? child
                    : Image.asset(
                        'assets/images/loading_error_image.jpeg',
                        width: 155,
                        height: 155,
                      ),
                errorBuilder: (BuildContext context, Object exception,
                        StackTrace stackTrace) =>
                    Image.asset(
                  'assets/image/loading_error_image.jpeg',
                  width: 155,
                  height: 155,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      personage.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: ColorsStyles.textHeaderWhite70,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 17,
                        color: personage.status == 'Alive'
                            ? Colors.green
                            : personage.status == 'unknown'
                                ? Colors.yellow
                                : Colors.red,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${personage.status} - ${personage.species}',
                          style: const TextStyle(
                            color: ColorsStyles.textHeaderWhite70,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Origin:',
                    style: TextStyle(
                      color: ColorsStyles.textHeaderWhite70,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    personage.origin,
                    style: const TextStyle(
                      color: ColorsStyles.textInfoPersonageWhite54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Last known location:',
                    style: TextStyle(
                      color: ColorsStyles.textHeaderWhite70,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    personage.location,
                    style: const TextStyle(
                      color: ColorsStyles.textInfoPersonageWhite54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
