import 'package:flutter/material.dart';

import '../app_localizations.dart';

class CvScreen extends StatelessWidget {
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context).translate("reserve_photo_cv"),
            style: TextStyle(color: Colors.lightBlue, fontSize: 20),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(),
          child: Card(
            color: Colors.lightGreen,
            elevation: 4,
            child: buildForm(context),
          ),
        ),
      ],
    );
  }
}
