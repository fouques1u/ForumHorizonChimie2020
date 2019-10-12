import 'package:flutter/material.dart';

import '../../widgets/page_title_classic.dart';
import '../../widgets/outline_button_classic.dart';
import '../../colors.dart';

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
          ClassicPageTitle(
            title: 'second_floor',
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/images/plan_etage_2.png",
              width: MediaQuery.of(context).size.width * 0.9,
            ),
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
                OutlineButtonClassic(text: '201', action: () {},),
                OutlineButtonClassic(text: '202', action: () {},),
                OutlineButtonClassic(text: '203', action: () {},),
                OutlineButtonClassic(text: '204', action: () {},),
                OutlineButtonClassic(text: '205', action: () {},),
                OutlineButtonClassic(text: '206', action: () {},),
                OutlineButtonClassic(text: '207', action: () {},),
                OutlineButtonClassic(text: '208', action: () {},),
                OutlineButtonClassic(text: '209', action: () {},),
                OutlineButtonClassic(text: '210', action: () {},),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
