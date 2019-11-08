import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/colors.dart';
import 'package:forum_horizon_chimie/widgets/outline_button_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

import '../app_localizations.dart';

class CvScreen extends StatefulWidget {
  @override
  _CvScreenState createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  final List<String> creneaux = [
    '9:00',
    '9:05',
    '9:10',
    '9:15',
    '9:20',
    '9:25',
    '9:30',
    '9:35',
    '9:40',
    '9:45',
    '9:50',
    '9:55',
    '10:00',
    '10:05',
    '10:10',
    '10:15',
    '10:20',
    '10:25',
    '10:30',
    '10:35',
    '10:40',
    '10:45',
    '10:50',
    '10:55',
    '11:00',
    '11:05',
    '11:10',
    '11:15',
    '11:20',
    '11:25',
    '11:30',
    '11:35',
    '11:40',
    '11:45',
    '11:50',
    '11:55',
    '12:00',
    '12:05',
    '12:10',
    '12:15',
    '12:20',
    '12:25',
    '12:30',
    '12:35',
    '12:40',
    '12:45',
    '12:50',
    '12:55',
    '13:00',
    '13:05',
    '13:10',
    '13:15',
    '13:20',
    '13:25',
    '13:30',
    '13:35',
    '13:40',
    '13:45',
    '13:50',
    '13:55',
    '14:00',
    '14:05',
    '14:10',
    '14:15',
    '14:20',
    '14:25',
    '14:30',
    '14:35',
    '14:40',
    '14:45',
    '14:50',
    '14:55',
    '15:00',
    '15:05',
    '15:10',
    '15:15',
    '15:20',
    '15:25',
    '15:30',
    '15:35',
    '15:40',
    '15:45',
    '15:50',
    '15:55',
    '16:00',
    '16:05',
    '16:10',
    '16:15',
    '16:20',
    '16:25',
    '16:30',
    '16:35',
    '16:40',
    '16:45',
    '16:50',
    '16:55',
    '17:00',
    '17:05',
    '17:10',
    '17:15',
    '17:20',
    '17:25',
    '17:30',
    '17:35',
    '17:40',
    '17:45',
    '17:50',
    '17:55',
  ];

  String nom = "";
  String prenom = "";
  String horaire = "";

  Widget buildForm(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.body1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: AppLocalizations.of(context).translate('surname'),
              hintStyle: TextStyle(
                color: Colors.white70,
                fontFamily: 'Gotham',
                fontSize: 14,
              ),
              labelText: AppLocalizations.of(context).translate('surname'),
              labelStyle: TextStyle(
                color: Colors.white70,
                fontFamily: 'Gotham',
                fontSize: 14,
              ),
            ),
            onSubmitted: (String textInput) {
              setState(() {
                prenom = textInput;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: Theme.of(context).textTheme.body1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: AppLocalizations.of(context).translate('name'),
              hintStyle: TextStyle(
                color: Colors.white70,
                fontFamily: 'Gotham',
                fontSize: 14,
              ),
              labelText: AppLocalizations.of(context).translate('name'),
              labelStyle: TextStyle(
                color: Colors.white70,
                fontFamily: 'Gotham',
                fontSize: 14,
              ),
            ),
            onSubmitted: (String textInput) {
              setState(() {
                nom = textInput;
              });
            },
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Text(
              AppLocalizations.of(context).translate('available_dates'),
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
            child: GridView.count(
              padding: EdgeInsets.all(5),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              childAspectRatio: 4,
              children: creneaux.map((String creneau) {
                return OutlineButtonClassic(
                  text: creneau,
                  action: () {
                    setState(() {
                      horaire = creneau;
                    });
                  },
                  longPressAction: () {},
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2, color: Colors.white),
                bottom: BorderSide(width: 2, color: Colors.white),
                right: BorderSide(width: 2, color: Colors.white),
                left: BorderSide(width: 2, color: Colors.white),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Prenom : $prenom",
                    style: Theme.of(context).textTheme.body1),
                Text("Nom : $nom", style: Theme.of(context).textTheme.body1),
                Text(horaire, style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                AppLocalizations.of(context).translate('confirm'),
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: lightGreenColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: lightBlueColor,
                      blurRadius: 5,
                    ),
                  ]),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          ClassicPageTitle(
            title: 'reserve_photo_cv',
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(15, 10, 15, 30),
            decoration: BoxDecoration(
              color: simpleBlueColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: lightBlueColor,
                ),
              ],
              gradient: LinearGradient(
                colors: <Color>[
                  simpleBlueColor,
                  darkBlueColor,
                ],
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
              ),
            ),
            child: buildForm(context),
          ),
        ],
      ),
    );
  }
}
