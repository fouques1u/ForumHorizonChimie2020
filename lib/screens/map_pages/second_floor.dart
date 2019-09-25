import 'package:flutter/material.dart';

class SecondFloorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Image.asset(
        "assets/images/plan_etage_2.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
