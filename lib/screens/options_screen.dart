import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text(AppLocalizations.of(context).translate('test')),
          onPressed: () => changeLocale(Locale('fr', 'FR')),
        ),
        RaisedButton(
          child: Text('Anglais'),
          onPressed: () => changeLocale(Locale('en', 'EN')),
        ),
        RaisedButton(
          child: Text('Facebook'),
          onPressed: () => _launchFacebookUrl(_oldFacebookUrl, _facebookUrl),
        ),
        RaisedButton(
          child: Text('LinkedIn'),
          onPressed: () => _launchURL(_linkedInUrl),
        ),
        RaisedButton(
          child: Text('Twitter'),
          onPressed: () => _launchURL(_twitterUrl),
        ),
        RaisedButton(
          child: Text('Maps'),
          onPressed: () => _launchURL(_mapsUrl),
        ),
        RaisedButton(
          child: Text('Website'),
          onPressed: () => _launchWebviewURL(_webSiteUrl),
        ),
      ],
    );
  }
}
