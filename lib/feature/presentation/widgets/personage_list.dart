import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_state.dart';
import 'package:rick_and_morty_mvp/feature/presentation/pages/info_personage_page.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';

class PersonageList extends StatelessWidget {
  const PersonageList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonageBloc, PersonageState>(
        builder: (context, state) {
      if (state is PersonageLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PersonageLoadedState) {
        if (state.loadedPersonage.isEmpty) {
          return const Center(
            child: Text('The data is not loaded. Press button "Load".'),
          );
        } else {
          return ListView.builder(
            itemCount: state.loadedPersonage.length,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.white24,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => InfoPersonagePage(
                          personage: state.loadedPersonage[index]),
                    ),
                  );
                },
                leading: Image.network(
                  state.loadedPersonage[index].image,
                  width: 100,
                  height: 100,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        state.loadedPersonage[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: ColorsStyles.textHeaderWhite70,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          size: 17,
                          color: Colors.green,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Alive - Humen',
                            style: const TextStyle(
                              color: ColorsStyles.textHeaderWhite70,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Origin:',
                      style: const TextStyle(
                        color: ColorsStyles.textHeaderWhite70,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Earth (C-137)',
                      style: const TextStyle(
                        color: ColorsStyles.textInfoPersonageWhite54,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Last known location:',
                      style: const TextStyle(
                        color: ColorsStyles.textHeaderWhite70,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Earth (Replacement Dimension)',
                      style: const TextStyle(
                        color: ColorsStyles.textInfoPersonageWhite54,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    });
  }
}
