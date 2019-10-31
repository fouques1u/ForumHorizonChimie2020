import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/curved_bottom_navigation_bar.dart';
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
  final GlobalKey _bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController();
  List<Map<String, Object>> _pages;
  CurvedNavigationBarState _navigationBarState;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectDestination(int indexScreen) {
    setState(() {
      _selectedPageIndex = indexScreen;
      _navigationBarState = _bottomNavigationKey.currentState;
      _navigationBarState.setPage(_selectedPageIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': HomeScreen(
          selectDestination: _selectDestination,
        ),
        'title_code': 'home'
      },
      {
        'page': MapScreen(
          controller: _pageController,
        ),
        'title_code': 'plan'
      },
      {'page': CvScreen(), 'title_code': 'cv_registering'},
      {
        'page': OptionsScreen(
          changeLocale: widget.setNewLanguage,
        ),
        'title_code': 'options'
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: CurvedBottomNavigationBar(
          bottomNavigationKey: _bottomNavigationKey,
          changePage: _selectPage,
        ));
  }
}
