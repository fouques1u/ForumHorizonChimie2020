import 'package:flutter/material.dart';
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
    _pages = [
      {'page': HomeScreen(), 'title': 'Accueil'},
      {'page': MapScreen(controller:  PageController(keepPage: true, initialPage: 2)), 'title': 'Plan'},
      {'page': CvScreen(), 'title': 'Créneaux CV'},
      {'page': OptionsScreen(changeLocale: widget.setNewLanguage,), 'title': 'Paramètres'}
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: CurvedBottomNavigationBar(
        changePage: _selectPage,
      ),
    );
  }
}
