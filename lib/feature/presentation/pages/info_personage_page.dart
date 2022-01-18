import 'package:flutter/material.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
