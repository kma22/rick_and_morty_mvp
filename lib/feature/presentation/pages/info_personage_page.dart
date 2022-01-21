import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/ui_util.dart';
import 'package:rick_and_morty_mvp/feature/presentation/widgets/info_episode.dart';

class InfoPersonagePage extends StatelessWidget {
  final Personage personage;

  InfoPersonagePage({Key key, @required this.personage}) : super(key: key);

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      personage.image,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    personage.name,
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
                      color: personage.status == 'Alive'
                          ? Colors.green
                          : personage.status == 'unknown'
                              ? Colors.yellow
                              : Colors.red,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${personage.status} - ${personage.species}',
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
                      ...buildText('Gender: ', personage.gender),
                      const SizedBox(height: 5),
                      ...buildText('Type: ', personage.type),
                      const SizedBox(height: 5),
                      ...buildText('Origin: ', personage.origin),
                      const SizedBox(height: 5),
                      ...buildText('Last known location: ', personage.location),
                      const SizedBox(height: 5),
                      ...buildText('Date of creation: ',
                          DateTransformation(personage.created)),
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
                      InfoEpisode(url: personage.episode),
                    ],
                  ),
                ),
              ],
            ),
          ),
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