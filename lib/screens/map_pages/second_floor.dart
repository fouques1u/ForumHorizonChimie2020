import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/widgets/outline_button_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

import '../../colors.dart';
import '../../app_localizations.dart';

class SecondFloorPage extends StatelessWidget {
  Widget buildCircularButton(BuildContext context, String standNumber) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: simpleBlueColor,
        ),
        child: Text(standNumber),
      ),
    );
  }

  Widget buildRow(BuildContext context, List<String> standNumbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: standNumbers.map((standNumber) {
        return buildCircularButton(context, standNumber);
      }).toList(),
    );
  }

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
          ClassicPageTitle(title: 'first_floor',),
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/images/plan_etage_1.png",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 15.0, spreadRadius: 0.0, color: lightBlueColor)
              ],
              shape: BoxShape.rectangle,
              color: darkBlueColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GridView.count(
              padding: EdgeInsets.all(5),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
              children: <Widget>[
                OutlineButtonClassic(text: '101', action: () {},),
                OutlineButtonClassic(text: '102', action: () {},),
                OutlineButtonClassic(text: '103', action: () {},),
                OutlineButtonClassic(text: '104', action: () {},),
                OutlineButtonClassic(text: '105', action: () {},),
                OutlineButtonClassic(text: '106', action: () {},),
                OutlineButtonClassic(text: '106bis', action: () {},),
                OutlineButtonClassic(text: '107', action: () {},),
                OutlineButtonClassic(text: '108', action: () {},),
                OutlineButtonClassic(text: '109', action: () {},),
                OutlineButtonClassic(text: '110', action: () {},),
                OutlineButtonClassic(text: '111', action: () {},),
                OutlineButtonClassic(text: '112', action: () {},),
                OutlineButtonClassic(text: '113', action: () {},),
                OutlineButtonClassic(text: '115', action: () {},),
                OutlineButtonClassic(text: '116', action: () {},),
                OutlineButtonClassic(text: '117', action: () {},),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
