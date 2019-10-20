import 'package:flutter/material.dart';

import 'package:forum_horizon_chimie/screens/map_pages/first_floor.dart';
import 'package:forum_horizon_chimie/screens/map_pages/second_floor.dart';
import 'package:forum_horizon_chimie/screens/map_pages/third_floor.dart';
import './map_pages/search_firm.dart';

class MapScreen extends StatefulWidget {
  PageController controller;

  MapScreen({@required this.controller});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      children: <Widget>[
        SearchFirmPage(),
        FirstFloorPage(),
        SecondFloorPage(),
        ThirdFloorPage(),
      ],
    );
  }
}
