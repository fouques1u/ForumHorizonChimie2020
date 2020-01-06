import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/icon_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:forum_horizon_chimie/app_localizations.dart';
import 'package:forum_horizon_chimie/colors.dart';
import 'package:forum_horizon_chimie/data.dart';
import 'package:forum_horizon_chimie/utils.dart';
import 'package:forum_horizon_chimie/widgets/grid_tile_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

class HomeScreen extends StatefulWidget {
  final Function selectDestination;

  HomeScreen({@required this.selectDestination});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences _prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _prefs = await SharedPreferences.getInstance();

      bool _popUpShown =  await _prefs.getBool(isShownId) ?? false;

      if (!_popUpShown) {
        await showLargeBottomSheet(context);

        _popUpShown = true;
        await _prefs.setBool(isShownId, true);
      } 
    });
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
                  onTapFunction: () => widget.selectDestination(1),
                ),
                SizedBox(
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: simpleBlueColor,
                  textCode: 'conference',
                  onTapFunction: () => widget.selectDestination(2),
                ),
                SizedBox(
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: lightBlueColor,
                  textCode: "cv_registering",
                  onTapFunction: () => widget.selectDestination(3),
                ),
                SizedBox(
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: lightGreenColor,
                  textCode: "options",
                  onTapFunction: () => widget.selectDestination(4),
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
