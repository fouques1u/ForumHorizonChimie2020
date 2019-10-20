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
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppLocalizations.of(context).translate('name')),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppLocalizations.of(context).translate('surname')),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Text(
              AppLocalizations.of(context).translate('available_dates'),
              style: TextStyle(
                fontSize: 16,
              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('data'),
              Text('data'),
              Text('data'),
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
          SizedBox(
            height: 10,
          ),
          ClassicPageTitle(
            title: 'reserve_photo_cv',
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  lightBlueColor,
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
