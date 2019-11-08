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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: GridTileClassic(
              colorTile: darkBlueColor,
              textCode: "president_word",
              onTapFunction: () {
                showModalBottomSheet(
                  backgroundColor: lightGreenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      color: lightGreenColor,
                      margin: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)
                                .translate('president_word_title'),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gotham',
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            AppLocalizations.of(context).translate('president_word_text'),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gotham',
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                    ;
                  },
                  context: context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
