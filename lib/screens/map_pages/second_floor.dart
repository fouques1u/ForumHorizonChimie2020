import 'package:flutter/material.dart';
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
              "assets/images/plan_etage_2.png",
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
            child: Column(
              children: <Widget>[
                buildRow(context, [
                  '201',
                  '202',
                  '203',
                  '204',
                  '205',
                ]),
                SizedBox(
                  height: 10,
                ),
                buildRow(context, [
                  '206',
                  '207',
                  '208',
                  '209',
                  '210',
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
