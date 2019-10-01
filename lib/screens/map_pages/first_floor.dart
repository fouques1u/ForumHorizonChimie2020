import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/app_localizations.dart';

import '../../colors.dart';

class FirstFloorPage extends StatelessWidget {
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
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  lightGreenColor,
                  lightBlueColor,
                  simpleBlueColor,
                  darkBlueColor,
                ],
              ),
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.white, width: 1.0),
            ),
            alignment: Alignment.center,
            child: FittedBox(
                child: Text(
              AppLocalizations.of(context).translate('first_floor'),
              style: Theme.of(context).textTheme.subtitle,
            )),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/plan_rdc.png"),
          ),
          // TODO : Change the disposal of the stands.
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
                  '01',
                  '02',
                  '03',
                  '04',
                  '05',
                ]),
                SizedBox(
                  height: 10,
                ),
                buildRow(context, [
                  '06',
                  '07',
                  '08',
                  '09',
                  '10',
                ]),
                SizedBox(
                  height: 10,
                ),
                buildRow(context, [
                  '11',
                  '12',
                  '13',
                  '14',
                  '15',
                ]),
                SizedBox(
                  height: 10,
                ),
                buildRow(context, [
                  '16',
                  '17',
                  '18',
                  '20',
                  '20bis',
                ]),
                SizedBox(
                  height: 10,
                ),
                buildRow(context, [
                  '21',
                  '23',
                  '25',
                  '26',
                  '27',
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildCircularButton(context, '28'),
                    buildCircularButton(context, '29'),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: simpleBlueColor,
                        ),
                        child: Text('Handicafé'), // TODO : Translate
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
