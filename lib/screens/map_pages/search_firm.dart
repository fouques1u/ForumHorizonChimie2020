import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

import '../../app_localizations.dart';
import '../../colors.dart';

class SearchFirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/forum-apercu.jpg'),
            fit: BoxFit.none),
        color: Theme.of(context).primaryColor,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          ClassicPageTitle(title: 'search_firm'),
        ],
      ),
    );
  }
}
