import 'package:flutter/material.dart';

import '../app_localizations.dart';

class ConferenceModalBottomSheet extends StatelessWidget {
  final Map<String,String> conference;

  ConferenceModalBottomSheet({@required this.conference});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).currentLanguage() == 'fr' ? conference['sujet_fr'] : conference['sujet_en'],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 24,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            conference['horaire'],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            conference['intervenant'],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            conference['organisme'],
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
            AppLocalizations.of(context).currentLanguage() == 'fr' ? conference['description_fr'] : conference['description_en'],
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
          
        ],
      ),
    );
  }
}