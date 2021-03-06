import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

import '../app_localizations.dart';

class FirmModalBottomSheet extends StatelessWidget {
  final Map<String, String> standInformations;

  FirmModalBottomSheet({@required this.standInformations});

  Future _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _launchFacebookUrl(String oldUrl, String newUrl, String url) async {
    if (await canLaunch(newUrl)) {
      await launch(newUrl);
    } else {
      if (Platform.isIOS && await canLaunch(url)) {
        await launch(url);
      }
      throw 'Could not launch $newUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Text(
            standInformations['nom'],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 24,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Stand : ${standInformations['stand']}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context).currentLanguage() == 'fr' ? standInformations['description_fr'] : standInformations['description_en'],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadiusDirectional.circular(15)),
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
                        _launchFacebookUrl(standInformations['old_facebook_url'], standInformations['facebook_url'], standInformations['facebook_url'].substring(25)),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Color.fromRGBO(0, 119, 181, 1),
                    ),
                    onTap: () => _launchURL(standInformations['linkedin_url']),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.lightBlue,
                    ),
                    onTap: () => _launchURL(standInformations['twitter_url']),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Icon(
                      Icons.language,
                      color: Colors.lightBlue,
                    ),
                    onTap: () => _launchURL(standInformations['web_url']),
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
