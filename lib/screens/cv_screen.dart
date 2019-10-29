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
  Widget buildForm(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.body1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppLocalizations.of(context).translate('name'),
              hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Gotham', fontSize: 14,),
            ),
          ),
          TextField(
            style: Theme.of(context).textTheme.body1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppLocalizations.of(context).translate('surname'),
              hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Gotham', fontSize: 14,),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
              children: <Widget>[
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
                OutlineButtonClassic(text: '8:00', action: () {}),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('data', style: Theme.of(context).textTheme.body1),
              Text('data', style: Theme.of(context).textTheme.body1),
              Text('data', style: Theme.of(context).textTheme.body1),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(5),
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
          )
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
