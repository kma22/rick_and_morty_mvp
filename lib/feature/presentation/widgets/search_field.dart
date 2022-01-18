import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: ColorsStyles.appBarColorWhite87,
      ),
      textAlign: TextAlign.center,
      onChanged: (text) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsStyles.appBarColorWhite87),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsStyles.appBarColorWhite87),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsStyles.appBarColorWhite87),
        ),
        hintText: 'Search by name',
        hintStyle: TextStyle(color: ColorsStyles.appBarColorWhite87),
      ),
    );
  }
}
