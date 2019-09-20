import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/app_localizations.dart';
import 'package:forum_horizon_chimie/curved_bottom_navigation_bar.dart';

import 'screens/cv_screen.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/options_screen.dart';

class HomePage extends StatefulWidget {
  final String title;
  final Function setNewLanguage;

  HomePage({this.title, this.setNewLanguage});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

     _pages = [
      {'page': HomeScreen(), 'title_code': 'home'},
      {'page': MapScreen(controller:  PageController(keepPage: true, initialPage: 2)), 'title_code': 'plan'},
      {'page': CvScreen(), 'title_code': 'cv_registering'},
      {'page': OptionsScreen(changeLocale: widget.setNewLanguage,), 'title_code': 'options'}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(AppLocalizations.of(context).translate(_pages[_selectedPageIndex]['title_code']), style: Theme.of(context).textTheme.title,),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: CurvedBottomNavigationBar(
        changePage: _selectPage,
      ),
    );
  }
}
