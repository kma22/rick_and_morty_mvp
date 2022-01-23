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
  static const _genderKey = 'gender';
  static const _typeKey = 'type';
  static const _episodeKey = 'episode';
  static const _createdKey = 'created';

  final int id;
  final String name;
  final String status;
  final String species;
  final String origin;
  final String location;
  final String image;
  final String gender;
  final String type;
  final List episode;
  final String created;

  ApiPersonage.fromMap(Map<String, dynamic> map)
      : id = map[_idKey],
        name = map[_nameKey],
        status = map[_statusKey],
        species = map[_speciesKey],
        origin = map[_originKey][_originNameKey],
        location = map[_locationKey][_locationNameKey],
        image = map[_imageKey],
        gender = map[_genderKey],
        type = map[_typeKey],
        episode = map[_episodeKey],
        created = map[_createdKey];
}
