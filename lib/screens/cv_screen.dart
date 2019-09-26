import 'package:flutter/material.dart';

import '../app_localizations.dart';

class CvScreen extends StatelessWidget {
  Widget buildTimeSlot(BuildContext context) {
    return DecoratedBox(
      child: OutlineButton(
        child: Text(
          '8:00',
          style: TextStyle(color: Colors.lightBlue),
        ),
        onPressed: () {},
        borderSide: BorderSide(color: Colors.lightBlue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
    );
  }

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
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              childAspectRatio: 4,
              children: <Widget>[
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
                buildTimeSlot(context),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text('data'),
              Text('data'),
              Text('data'),
              OutlineButton(
                child: Text(AppLocalizations.of(context).translate('confirm')),
              )
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
      ),
    );
  }
}
