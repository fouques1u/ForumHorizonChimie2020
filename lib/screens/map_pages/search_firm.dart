import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

import '../../app_localizations.dart';
import '../../colors.dart';

class SearchFirmPage extends StatelessWidget {
  TextEditingController _editingController = TextEditingController();

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
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadiusDirectional.circular(15)),
            child: EditableText(
              onChanged: (String text) {
                /* setState(() {
                  userInput = text;
                });*/
              },
              controller: _editingController,
              backgroundCursorColor: darkBlueColor,
              cursorColor: simpleBlueColor,
              style: TextStyle(color: darkBlueColor, fontFamily: 'Gotham', fontSize: 20, ),
              focusNode: FocusNode(),
            ),
          )
        ],
      ),
    );
  }
}
