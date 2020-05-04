import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/data.dart';
import 'package:forum_horizon_chimie/widgets/conference_widget.dart';

import '../widgets/page_title_classic.dart';

class ConferenceScreen extends StatefulWidget {
  @override
  _ConferenceScreenState createState() => _ConferenceScreenState();
}

class _ConferenceScreenState extends State<ConferenceScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: conferencesData.length+1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return ClassicPageTitle(
              title: 'conference',
            );
          }

          return ConferenceWidget(
            conference: conferencesData[index - 1],
          );
        },
      ),
    );
  }
}
