import 'package:flutter/material.dart';

import 'package:forum_horizon_chimie/app_localizations.dart';

class GridTileClassic extends StatelessWidget {
  final Color colorTile;
  final String textCode;
  final Function onTapFunction;
  final double height;
  Icon icon;

  GridTileClassic({@required this.colorTile, @required this.textCode, @required this.onTapFunction, @required this.height});

  @override
  Widget build(BuildContext context) {
    switch (textCode) {
      case 'firms':
        icon = Icon(
          Icons.map,
          color: Colors.white,
          size: 20,
        );
        break;
      case 'ground_floor':
        icon = Icon(
          Icons.filter_1,
          color: Colors.white,
          size: 20,
        );
        break;
      case 'second_floor':
        icon = Icon(
          Icons.filter_3,
          color: Colors.white,
          size: 20,
        );
        break;
      case 'first_floor':
        icon = Icon(
          Icons.filter_2,
          color: Colors.white,
          size: 20,
        );
        break;
      case 'cv_registering':
        icon = Icon(
          Icons.event_note,
          color: Colors.white,
          size: 20,
        );
        break;
      case 'conference':
        icon = Icon(
          Icons.format_quote,
          color: Colors.white,
          size: 20,
        );
        break;
      case 'options':
        icon = Icon(
          Icons.info,
          color: Colors.white,
          size: 20,
        );
        break;
      default:
        icon = Icon(
          Icons.access_alarm,
          color: Colors.white,
        );
    }
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: height,
        child: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icon,
              SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context).translate(textCode),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), shape: BoxShape.rectangle, color: colorTile, boxShadow: <BoxShadow>[
          BoxShadow(color: colorTile, blurRadius: 6, spreadRadius: 0),
        ]),
      ),
    );
  }
}
