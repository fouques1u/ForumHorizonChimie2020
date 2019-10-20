import 'package:flutter/material.dart';

import '../data.dart';
import 'package:forum_horizon_chimie/app_localizations.dart';

class GridTileClassic extends StatelessWidget {
  final Color colorTile;
  final String textCode;

  GridTileClassic({@required this.colorTile, @required this.textCode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getFirms();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: FittedBox(
          alignment: Alignment.bottomRight,
          child: Text(
            AppLocalizations.of(context).translate(textCode),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            color: colorTile,
            gradient: LinearGradient(
              colors: <Color>[colorTile, Colors.white],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(color: colorTile, blurRadius: 6, spreadRadius: 0),
            ]),
      ),
    );
  }
}
