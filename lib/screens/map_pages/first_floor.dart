import 'package:flutter/material.dart';

class FirstFloorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/plan_rdc.png"),
          ),
        ],
      ),
    );
  }
}
