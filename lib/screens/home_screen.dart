import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:forum_horizon_chimie/app_localizations.dart';
import 'package:forum_horizon_chimie/colors.dart';
import 'package:forum_horizon_chimie/widgets/grid_tile_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';
import '../data.dart';

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
          GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: <Widget>[
              GridTileClassic(
                colorTile: darkBlueColor,
                textCode: "firms",
                onTapFunction: () => selectDestination(1),
              ),
              GridTileClassic(
                colorTile: simpleBlueColor,
                textCode: "cv_registering",
                onTapFunction: () => selectDestination(2),
              ),
              GridTileClassic(
                colorTile: lightBlueColor,
                textCode: "options",
                onTapFunction: () => selectDestination(3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
