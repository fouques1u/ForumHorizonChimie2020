import 'package:flutter/material.dart';

import 'package:forum_horizon_chimie/colors.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app_localizations.dart';

class OptionsScreen extends StatelessWidget {
  final Function changeLocale;
  final String _oldFacebookUrl =
      'fb://page/forumhorizonchimie'; // Handle versions in Facebook
  final String _facebookUrl =
      'fb://facewebmodal/f?href=https://www.facebook.com/forumhorizonchimie/';
  final String _linkedInUrl =
      'https://www.linkedin.com/company/forum-horizon-chimie/';
  final String _twitterUrl = 'http://www.twitter.com/horizonchimie';
  final String _webSiteUrl = 'https://www.forumhorizonchimie.fr/';
  final String _mapsUrl =
      'https://www.google.com/maps/place/Forum+Horizon+Chimie/@48.8600226,2.314296,17z/data=!3m1!4b1!4m5!3m4!1s0x47e671e95e4d38a9:0xc5a15028a9da8d86!8m2!3d48.8600191!4d2.3164847'; // Change maps url

  OptionsScreen({this.changeLocale});

  Future _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _launchFacebookUrl(String oldUrl, String newUrl) async {
    //TODO: Manage the old way of going into a facebook app with id
    if (await canLaunch(newUrl)) {
      await launch(newUrl);
    } else {
      throw 'Could not launch $newUrl';
    }
  }

  Future _launchWebviewURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // force web view ?
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/img_3_gradient.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: <Widget>[
          ClassicPageTitle(
            title: "options",
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: darkBlueColor,
              gradient: LinearGradient(
                colors: <Color>[darkBlueColor, simpleBlueColor],
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  spreadRadius: 0.0,
                  color: lightBlueColor,
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context).translate("choose_language"),
                    style:
                        TextStyle(color: Colors.white, fontSize: titleTextSize),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      OutlineButton(
                        child: Text(
                          AppLocalizations.of(context).translate('french'),
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => changeLocale(Locale('fr', 'FR')),
                        borderSide: BorderSide(color: lightBlueColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      OutlineButton(
                        child: Text(
                          AppLocalizations.of(context).translate('english'),
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => changeLocale(Locale('en', 'EN')),
                        borderSide: BorderSide(color: lightBlueColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context).translate("social_media"),
                    style:
                        TextStyle(color: Colors.white, fontSize: titleTextSize),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Icon(
                            FontAwesomeIcons.facebook,
                            color: Color.fromRGBO(60, 90, 153, 1),
                          ),
                          onTap: () =>
                              _launchFacebookUrl(_oldFacebookUrl, _facebookUrl),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Icon(
                            FontAwesomeIcons.linkedin,
                            color: Color.fromRGBO(0, 119, 181, 1),
                          ),
                          onTap: () => _launchURL(_linkedInUrl),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.lightBlue,
                          ),
                          onTap: () => _launchURL(_twitterUrl),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Icon(
                            Icons.language,
                            color: darkBlueColor,
                          ),
                          onTap: () => _launchURL(_webSiteUrl),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
