import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/app_localizations.dart';
import 'package:forum_horizon_chimie/widgets/outline_button_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';

import '../../colors.dart';

class FirstFloorPage extends StatelessWidget {
  Widget buildCircularButton(BuildContext context, String standNumber) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            elevation: 4,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(standNumber),
              );
            });
      },
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
            child: GridView.count(
              padding: EdgeInsets.all(5),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
              children: <Widget>[
                OutlineButtonClassic(text: '1', action: () {},),
                OutlineButtonClassic(text: '2', action: () {},),
                OutlineButtonClassic(text: '3', action: () {},),
                OutlineButtonClassic(text: '4', action: () {},),
                OutlineButtonClassic(text: '5', action: () {},),
                OutlineButtonClassic(text: '6', action: () {},),
                OutlineButtonClassic(text: '7', action: () {},),
                OutlineButtonClassic(text: '8', action: () {},),
                OutlineButtonClassic(text: '9', action: () {},),
                OutlineButtonClassic(text: '10', action: () {},),
                OutlineButtonClassic(text: '11', action: () {},),
                OutlineButtonClassic(text: '12', action: () {},),
                OutlineButtonClassic(text: '13', action: () {},),
                OutlineButtonClassic(text: '14', action: () {},),
                OutlineButtonClassic(text: '15', action: () {},),
                OutlineButtonClassic(text: '16', action: () {},),
                OutlineButtonClassic(text: '17', action: () {},),
                OutlineButtonClassic(text: '18', action: () {},),
                OutlineButtonClassic(text: '20', action: () {},),
                OutlineButtonClassic(text: '20bis', action: () {},),
                OutlineButtonClassic(text: '21', action: () {},),
                OutlineButtonClassic(text: '23', action: () {},),
                OutlineButtonClassic(text: '25', action: () {},),
                OutlineButtonClassic(text: '26', action: () {},),
                OutlineButtonClassic(text: '27', action: () {},),
                OutlineButtonClassic(text: '28', action: () {},),
                OutlineButtonClassic(text: '29', action: () {},),
                OutlineButtonClassic(text: 'Handicafé', action: () {},),
              ],
            )
          ),
        ],
      ),
    );
  }
}
