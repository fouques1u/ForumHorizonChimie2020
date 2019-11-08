import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:forum_horizon_chimie/colors.dart';
import './app_localizations.dart';
import './application.dart';
import 'home_page.dart';
import './data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState() {
    super.initState();

    _localeOverrideDelegate = new SpecificLocalizationDelegate(null);

    applic.onLocaleChanged = onLocaleChange;

    getFirms();
    getCreneaux();
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forum Horizon Chimie',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: darkBlueColor,
        bottomAppBarColor: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 14,
            fontFamily: 'Gotham',
            color: Colors.white,
          ),
          body2: TextStyle(
            fontSize: 14,
            fontFamily: 'Gotham',
            color: darkBlueColor,
          ),
          title: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontFamily: 'Gotham'
          ),
          subtitle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Gotham',
          ),
        ),
      ),
      home: HomePage(
        title: 'Forum Horizon Chimie',
        setNewLanguage: onLocaleChange,
      ),
      supportedLocales: [
        const Locale('fr', 'FR'),
        const Locale('en', 'US'),
      ],
      localizationsDelegates: [
        _localeOverrideDelegate,
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
