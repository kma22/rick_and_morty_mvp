import 'package:flutter/material.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';
import 'package:rick_and_morty_mvp/feature/presentation/widgets/search_field.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({Key key}) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      height: 60.0,
      color: Colors.white12,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: _showSearch ? Row(
          key: UniqueKey(),
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _showSearch = false;
                });
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorsStyles.appBarColorWhite87,
              ),
            ),
            Expanded(
              child: SearchField(),
            ),
          ],
        )
        : Row(
          key: UniqueKey(),
          children: [
            Expanded(
              child: Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Rick and Morty (MVP)',
                    style: TextStyle(
                      color: ColorsStyles.appBarColorWhite87,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _showSearch = true;
                });
              },
              icon: Icon(
                Icons.search_rounded,
                color: ColorsStyles.appBarColorWhite87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
