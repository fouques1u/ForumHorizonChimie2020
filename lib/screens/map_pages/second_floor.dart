import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/widgets/arrow.dart';

import '../../widgets/firm_modal_bottom_sheet.dart';
import '../../widgets/outline_button_classic.dart';
import '../../widgets/page_title_classic.dart';
import '../../colors.dart';

class SecondFloorPage extends StatelessWidget {
  final PageController pageController;

  SecondFloorPage({@required this.pageController});

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

  final List<String> standNumbers = [
    '101',
    '102',
    '103',
    '104',
    '105',
    '106',
    '106bis',
    '107',
    '108',
    '109',
    '110',
    '111',
    '112',
    '113',
    '115',
    '116',
    '117',
  ];

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
            title: 'first_floor',
          ),
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
              gradient: LinearGradient(
                colors: <Color>[
                  darkBlueColor,
                  simpleBlueColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
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
              children: standNumbers
                  .map((String standNumber) => OutlineButtonClassic(
                        text: standNumber,
                        action: () =>
                            showFirmInformations(context, standNumber),
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Arrow(
                  onPressed: () {
                    pageController.animateToPage(
                      1,
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 650),
                    );
                  },
                  isForward: false,
                ),
                margin: EdgeInsets.all(20),
              ),
              Container(
                child: Arrow(
                  onPressed: () {
                    pageController.animateToPage(
                      3,
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 650),
                    );
                  },
                  isForward: true,
                ),
                margin: EdgeInsets.all(20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
