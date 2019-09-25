import 'package:flutter/material.dart';

class FirstFloorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/plan_rdc.png"),
          Text('data')
        ],
      ),
    );
  }
}
