import 'package:flutter/material.dart';

import '../../widgets/page_title_classic.dart';

class ThirdFloorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          ClassicPageTitle(title: 'second_floor',),
        ],
      ),
    );
  }
}
