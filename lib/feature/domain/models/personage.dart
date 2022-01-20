import 'package:flutter/material.dart';

class Personage {
  final int id;
  final String name;
  final String status;
  final String species;
  final String origin;
  final String location;
  final String image;
  final String gender;
  final String type;
  final List<String> episode;
  final DateTime created;

  Personage({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.species,
    @required this.origin,
    @required this.location,
    @required this.image,
    @required this.gender,
    @required this.type,
    @required this.episode,
    @required this.created,
  });
}
