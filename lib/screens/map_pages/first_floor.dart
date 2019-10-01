import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/app_localizations.dart';

import '../../colors.dart';

class FirstFloorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  lightGreenColor,
                  lightBlueColor,
                  simpleBlueColor,
                  darkBlueColor,
                ],
              ),
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.white, width: 1.0),
            ),
            alignment: Alignment.center,
            child: FittedBox(child: Text(AppLocalizations.of(context).translate('first_floor'), style: Theme.of(context).textTheme.subtitle,)),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/plan_rdc.png"),
          ),
        ],
      ),
    );
  }
}
