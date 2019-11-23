import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/widgets/conference_modal_bottom_sheet.dart';
import 'package:forum_horizon_chimie/widgets/conference_widget.dart';

import '../widgets/page_title_classic.dart';
import '../app_localizations.dart';
import '../colors.dart';

class ConferenceScreen extends StatefulWidget {
  @override
  _ConferenceScreenState createState() => _ConferenceScreenState();
}

class _ConferenceScreenState extends State<ConferenceScreen> {
  void showConferenceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: lightGreenColor,
      context: context,
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      builder: (BuildContext context) {
        return ConferenceModalBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          ClassicPageTitle(
            title: 'conference',
          ),
          ConferenceWidget(
            onTapFunction: () => showConferenceBottomSheet(context),
          ),
        ],
      ),
    );
  }
}
