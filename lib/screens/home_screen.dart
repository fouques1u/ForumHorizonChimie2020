import 'package:flutter/material.dart';
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

      bool _popUpShown = await _prefs.getBool(isShownId) ?? false;

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
                style: Theme.of(context).textTheme.headline6.apply(color: colorFour),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: <Color>[
                  colorFour,
                  colorThree,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  spreadRadius: 0.0,
                  color: colorFour,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Date
                Text(
                  AppLocalizations.of(context).translate("date_forum"),
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 15,
                ),
                // Horaire
                Text(
                  AppLocalizations.of(context).translate("horaires_forum"),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 5,
                ),
                // Entrée libre et gratuite
                Text(
                  AppLocalizations.of(context).translate("entree_forum"),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 5,
                ),
                // Restauration
                Text(
                  AppLocalizations.of(context).translate("restauration_forum"),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 15,
                ),
                // Maison de la chimie
                Text(
                  AppLocalizations.of(context).translate("lieu_forum"),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 5,
                ),
                // Adresse
                Text(
                  AppLocalizations.of(context).translate("adresse_forum"),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 15,
                ),
                // Transports Metro + RER
                Text(
                  AppLocalizations.of(context).translate("metro_forum"),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context).translate("rer_forum"),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GridTileClassic(
                  height: 50,
                  colorTile: colorFour,
                  textCode: "firms",
                  onTapFunction: () async {
                    widget.selectDestination(1);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: colorThree,
                  textCode: 'conference',
                  onTapFunction: () => widget.selectDestination(2),
                ),
                SizedBox(
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: colorTwo,
                  textCode: "cv_registering",
                  onTapFunction: () => widget.selectDestination(3),
                ),
                SizedBox(
                  height: 15,
                ),
                GridTileClassic(
                  height: 50,
                  colorTile: colorOne,
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
