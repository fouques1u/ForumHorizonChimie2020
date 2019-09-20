import 'package:flutter/material.dart';
import '../app_localizations.dart';

class OptionsScreen extends StatelessWidget {
  final Function changeLocale;

  OptionsScreen({this.changeLocale});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text(AppLocalizations.of(context).translate('test')),
          onPressed: () => changeLocale(Locale('fr', 'FR')),
        ),
        RaisedButton(
          child: Text('Anglais'),
          onPressed: () => changeLocale(Locale('en', 'EN')),
        ),
      ],
    );
  }
}
