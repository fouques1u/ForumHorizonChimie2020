import 'package:flutter/material.dart';

import 'package:forum_horizon_chimie/app_localizations.dart';
import 'package:forum_horizon_chimie/colors.dart';
import 'package:forum_horizon_chimie/widgets/grid_tile_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: <Widget>[
          ClassicPageTitle(
            title: "home",
          ),
          GridView.count(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: <Widget>[
              GridTileClassic(colorTile: darkBlueColor, textCode: "home",),
              GridTileClassic(colorTile: simpleBlueColor, textCode: "home",),
              GridTileClassic(colorTile: lightBlueColor, textCode: "home",),
              GridTileClassic(colorTile: lightGreenColor, textCode: "home",),
            ],
          ),
        ],
      ),
    );
  }
}
