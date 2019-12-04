import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/widgets/arrow.dart';

import '../../widgets/firm_modal_bottom_sheet.dart';
import '../../widgets/page_title_classic.dart';
import '../../widgets/outline_button_classic.dart';
import '../../colors.dart';
import '../../data.dart';

class ThirdFloorPage extends StatelessWidget {
  final PageController pageController;

  ThirdFloorPage({@required this.pageController});

  void showFirmInformations(BuildContext context, String standNumber) {
    showModalBottomSheet(
      backgroundColor: lightGreenColor,
      context: context,
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      builder: (context) => FirmModalBottomSheet(
        standInformations: getStandInformations(standNumber),
      ),
    );
  }

  final List<String> standNumbers = [
    '201',
    '202',
    '203',
    '204',
    '205',
    '206',
    '207',
    '208',
    '209',
    '210',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/img_2_gradient.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ClassicPageTitle(
            title: 'second_floor',
          ),
          Container(
            alignment: Alignment.center,
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
                        longPressAction: () {
                          final standInformations =
                              getStandInformations(standNumber);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor: darkBlueColor,
                            content: Text(
                              'Stand $standNumber : ${standInformations['nom']}',
                              style: Theme.of(context).textTheme.body1,
                            ),
                            duration: Duration(
                              milliseconds: 1000,
                            ),
                          ));
                        },
                      ))
                  .toList(),
            ),
          ),
          Container(
            child: Arrow(
              onPressed: () {
                pageController.animateToPage(
                  2,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 650),
                );
              },
              isForward: false,
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
