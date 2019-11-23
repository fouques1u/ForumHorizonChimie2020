import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/icon_data.dart';
import 'package:forum_horizon_chimie/app_localizations.dart';

import 'package:forum_horizon_chimie/colors.dart';
import 'package:forum_horizon_chimie/data.dart';
import 'package:forum_horizon_chimie/widgets/grid_tile_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

class HomeScreen extends StatelessWidget {
  final Function selectDestination;

  HomeScreen({@required this.selectDestination});

  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: <Widget>[
          ClassicPageTitle(
            title: "home",
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GridTileClassic(
                  height: 50,
                  colorTile: darkBlueColor,
                  textCode: "firms",
                  onTapFunction: () => selectDestination(1),
                ),
                SizedBox(
                  height: 10,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: simpleBlueColor,
                  textCode: "cv_registering",
                  onTapFunction: () => selectDestination(2),
                ),
                SizedBox(
                  height: 10,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: lightBlueColor,
                  textCode: "options",
                  onTapFunction: () => selectDestination(3),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
