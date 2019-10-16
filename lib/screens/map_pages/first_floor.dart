import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:forum_horizon_chimie/app_localizations.dart';
import 'package:forum_horizon_chimie/widgets/outline_button_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';
import '../../widgets/firm_modal_bottom_sheet.dart';
import '../../colors.dart';

class FirstFloorPage extends StatelessWidget {
  void showFirmInformations(BuildContext context, String standNumber) {
    showModalBottomSheet(
      backgroundColor: lightGreenColor,
      context: context,
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      builder: (context) => FirmModalBottomSheet(
        standNumber: standNumber,
      ),
    );
  }

  List<String> standNumbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '20',
    '20bis',
    '21',
    '23',
    '25',
    '26',
    '27',
    '28',
    '29',
    'Handicafé',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          ClassicPageTitle(title: 'ground_floor'),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/plan_rdc.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  darkBlueColor,
                  simpleBlueColor,
                  lightBlueColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  spreadRadius: 0.0,
                  color: lightBlueColor,
                  //offset: Offset.fromDirection(1),  See nike shop speed code vid.
                )
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
              children: standNumbers
                  .map(
                    (String standNumber) => OutlineButtonClassic(
                      text: standNumber,
                      action: () => showFirmInformations(context, standNumber),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
