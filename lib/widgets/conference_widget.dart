import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/app_localizations.dart';

import '../colors.dart';
import 'conference_modal_bottom_sheet.dart';

class ConferenceWidget extends StatelessWidget {
  final Map<String, String> conference;

  void showConferenceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: lightGreenColor,
      context: context,
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      builder: (BuildContext context) {
        return ConferenceModalBottomSheet(conference: conference);
      },
    );
  }

  ConferenceWidget({@required this.conference});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showConferenceBottomSheet(context),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              darkBlueColor,
              simpleBlueColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              spreadRadius: 0.0,
              color: darkBlueColor,
            )
          ],
          shape: BoxShape.rectangle,
          color: darkBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.mic,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).currentLanguage() == 'fr'
                        ? conference['sujet_fr']
                        : conference['sujet_en'],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gotham',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    conference['intervenant'],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gotham',
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    conference['horaire'],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gotham',
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
