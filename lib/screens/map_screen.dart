import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/screens/map_pages/first_floor.dart';
import 'package:forum_horizon_chimie/screens/map_pages/second_floor.dart';
import 'package:forum_horizon_chimie/screens/map_pages/third_floor.dart';

class MapScreen extends StatelessWidget {
  PageController controller;

  MapScreen({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      children: <Widget>[
        FirstFloorPage(),
        SecondFloorPage(),
        ThirdFloorPage(),
      ],
    );
  }
}
