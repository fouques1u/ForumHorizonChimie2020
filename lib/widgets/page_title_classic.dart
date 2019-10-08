import 'package:flutter/material.dart';

import '../colors.dart';
import '../app_localizations.dart';

class ClassicPageTitle extends StatelessWidget {
  final String title;

  ClassicPageTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            lightGreenColor,
            lightBlueColor,
            simpleBlueColor,
            darkBlueColor,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: lightBlueColor,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
          AppLocalizations.of(context).translate(title),
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
    );
  }
}
