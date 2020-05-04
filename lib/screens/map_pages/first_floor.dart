import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:forum_horizon_chimie/widgets/arrow.dart';
import 'package:forum_horizon_chimie/widgets/list_tile_firm_widget.dart';
import 'package:forum_horizon_chimie/widgets/outline_button_classic.dart';
import 'package:forum_horizon_chimie/widgets/page_title_classic.dart';
import '../../widgets/firm_modal_bottom_sheet.dart';
import '../../colors.dart';
import '../../data.dart';

class FirstFloorPage extends StatelessWidget {
  final PageController pageController;

  FirstFloorPage({@required this.pageController});

  final List<String> _standNumbers = [
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
      color: white,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ClassicPageTitle(title: 'ground_floor'),
          Center(
            child: FutureBuilder(
              future: firebaseStorageReference.child("etages/plan_rdc.png").getDownloadURL(),
              builder: (context, snapshot) {
                // TODO : Add handler on no connection.
                if (snapshot.hasData) {
                  return CachedNetworkImage(imageUrl: snapshot.data);
                }
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: colorFour,
                    valueColor: AlwaysStoppedAnimation(colorThree),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  colorFour,
                  colorThree,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  spreadRadius: 0.0,
                  color: colorFour,
                )
              ],
              shape: BoxShape.rectangle,
              color: colorFour,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: _standNumbers
                  .map((String standNumber) => FutureBuilder(
                        future: getStandInformations(standNumber),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting ||
                              snapshot.connectionState == ConnectionState.none ||
                              snapshot.data == null) {
                            return Container();
                          } else {
                            return ListTileFirmWidget(standInformations: snapshot.data);
                          }
                        },
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
                      0,
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
                      2,
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
