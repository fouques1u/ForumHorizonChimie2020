import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvedBottomNavigationBar extends StatelessWidget {
  final Function changePage;

  CurvedBottomNavigationBar({this.changePage});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      animationDuration: Duration(milliseconds: 500),
      height: 60,
      color: Theme.of(context).accentColor,
      backgroundColor: Colors.white,
      animationCurve: Curves.ease,
      items: [
        Icon(
          Icons.home,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        Icon(
          Icons.map,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        Icon(
          Icons.event_note,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        Icon(
          Icons.dehaze,
          color: Theme.of(context).primaryColor,
          size: 30,
        )
      ],
      onTap: (index) => changePage(index),
    );
  }
}
