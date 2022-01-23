import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_mvp/feature/domain/models/personage.dart';

class PersonageSearchResult {
  final int count;
  final int pages;
  final List<Personage> listPersonage;

  PersonageSearchResult({
    @required this.count,
    @required this.pages,
    @required this.listPersonage,
  });
}
