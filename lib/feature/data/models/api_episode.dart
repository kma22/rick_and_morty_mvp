class ApiEpisode {
  static const _nameKey = 'name';
  static const _airDataKey = 'air_date';
  static const _episodeKey = 'episode';

  final String name;
  final String airData;
  final String episode;


  ApiEpisode.fromMap(Map<String, dynamic> map)
      : name = map[_nameKey],
        airData = map[_airDataKey],
        episode = map[_episodeKey];
}
