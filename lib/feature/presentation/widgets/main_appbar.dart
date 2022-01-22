import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_bloc.dart';
import 'package:rick_and_morty_mvp/feature/presentation/bloc/personage_bloc/personage_event.dart';
import 'package:rick_and_morty_mvp/feature/presentation/styles/colors_styles.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({Key key}) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  bool _showSearch = false;
  PersonageBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<PersonageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      height: 60.0,
      color: Colors.white12,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: _showSearch
            ? Row(
                key: UniqueKey(),
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _bloc.add(PersonageLoadEvent(name: ''));
                        _showSearch = false;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsStyles.appBarColorWhite87,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ColorsStyles.appBarColorWhite87),
                      onSubmitted: (text) {
                        _bloc.add(PersonageLoadEvent(name: text));
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorsStyles.appBarColorWhite87)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorsStyles.appBarColorWhite87)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorsStyles.appBarColorWhite87)),
                        hintText: "Search",
                        hintStyle:
                            TextStyle(color: ColorsStyles.appBarColorWhite87),
                        helperStyle:
                            TextStyle(color: ColorsStyles.appBarColorWhite87),
                      ),
                    ),
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
