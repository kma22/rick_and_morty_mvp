import 'package:flutter/cupertino.dart';

class ApiPersonage {
  static const _idKey = 'id';
  static const _nameKey = 'name';
  static const _statusKey = 'status';
  static const _speciesKey = 'species';
  static const _originKey = 'origin';
  static const _originNameKey = 'name';
  static const _locationKey = 'location';
  static const _locationNameKey = 'name';
  static const _imageKey = 'image';
  static const _episodeKey = 'episode';

  final int id;
  final String name;
  final String status;
  final String species;
  final String origin;
  final String location;
  final String image;
  final List episode;

  ApiPersonage({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.species,
    @required this.origin,
    @required this.location,
    @required this.image,
    @required this.episode,
  });

  ApiPersonage.fromMap(Map<String, dynamic> map)
      : id = map[_idKey],
        name = map[_nameKey],
        status = map[_statusKey],
        species = map[_speciesKey],
        origin = map[_originKey][_originNameKey],
        location = map[_locationKey][_locationNameKey],
        image = map[_imageKey],
        episode = map[_episodeKey];
}
