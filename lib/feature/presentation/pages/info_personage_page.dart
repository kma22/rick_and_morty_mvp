import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';

class InfoPersonagePage extends StatelessWidget {
  final Personage personage;

  const InfoPersonagePage({Key key, @required this.personage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Rick and Morty (MVP)'),
        ),
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
              colors: [Colors.black, Colors.grey],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    personage.image,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                personage.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: ColorsStyles.textHeaderWhite70,
                  fontSize: 44,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    size: 17,
                    color:  personage.status == 'Alive'? Colors.green : Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Alive - Humen',
                    style: const TextStyle(
                      color: ColorsStyles.textHeaderWhite70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
