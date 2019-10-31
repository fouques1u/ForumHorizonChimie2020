import 'package:flutter/material.dart';

import 'package:forum_horizon_chimie/app_localizations.dart';

class GridTileClassic extends StatelessWidget {
  final Color colorTile;
  final String textCode;
  final Function onTapFunction;

  GridTileClassic({@required this.colorTile, @required this.textCode, @required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: FittedBox(
          alignment: Alignment.bottomRight,
          fit: BoxFit.scaleDown,
          child: Text(
            AppLocalizations.of(context).translate(textCode),
            style: Theme.of(context).textTheme.body1,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            color: colorTile,
            
            boxShadow: <BoxShadow>[
              BoxShadow(color: colorTile, blurRadius: 6, spreadRadius: 0),
            ]),
      ),
    );
  }
}
