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

  void showPresidentWord(BuildContext context) {
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
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        /*
        image: DecorationImage(
          image: ExactAssetImage('assets/images/img_1_gradient.jpg'),
          fit: BoxFit.cover,
        ),
        */
      ),
      child: ListView(
        children: <Widget>[
          ClassicPageTitle(
            title: "home",
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                AppLocalizations.of(context).translate('welcome_to_fhc'),
                style: Theme.of(context).textTheme.body2,
              ),
            ),
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
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: simpleBlueColor,
                  textCode: 'conference',
                  onTapFunction: () => selectDestination(2),
                ),
                SizedBox(
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: lightBlueColor,
                  textCode: "cv_registering",
                  onTapFunction: () => selectDestination(3),
                ),
                SizedBox(
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: lightGreenColor,
                  textCode: "options",
                  onTapFunction: () => selectDestination(4),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
