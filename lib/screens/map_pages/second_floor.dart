import 'package:flutter/material.dart';

class SecondFloorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        alignment: Alignment.topLeft,
        height: MediaQuery.of(context).size.height * 0.1, // Doesn't work
        child: Image.asset(
          "assets/images/plan_etage_2.png",
        ),
      ),
    );
  }
}
