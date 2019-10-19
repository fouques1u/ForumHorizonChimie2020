import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:forum_horizon_chimie/app_localizations.dart';
import 'package:forum_horizon_chimie/colors.dart';
import 'package:forum_horizon_chimie/widgets/grid_tile_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('firms').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Loading...');
        var data = snapshot.data.documents[0];
        return Column(children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text('data'),
          if (data.data != null) Text(data.data['nom'].toString()),
        ]);
      },
    );
    /*Container(
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
    );*/
  }
}
