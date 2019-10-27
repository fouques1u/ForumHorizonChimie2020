import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/widgets/arrow.dart';

import '../../widgets/grid_tile_classic.dart';
import '../../widgets/page_title_classic.dart';
import '../../colors.dart';

class SearchFirmPage extends StatelessWidget {
  TextEditingController _editingController = TextEditingController();
  final PageController pageController;

  SearchFirmPage({@required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/forum-apercu.jpg'),
            fit: BoxFit.none),
        color: Theme.of(context).primaryColor,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          ClassicPageTitle(title: 'search_firm'),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadiusDirectional.circular(15)),
            child: EditableText(
              onChanged: (String text) {
                /* setState(() {
                  userInput = text;
                });*/
              },
              controller: _editingController,
              backgroundCursorColor: darkBlueColor,
              cursorColor: simpleBlueColor,
              style: TextStyle(
                color: darkBlueColor,
                fontFamily: 'Gotham',
                fontSize: 20,
              ),
              focusNode: FocusNode(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GridTileClassic(
                  colorTile: darkBlueColor,
                  textCode: "ground_floor",
                  onTapFunction: () => pageController.animateToPage(
                        1,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 650),
                      )),
              GridTileClassic(
                  colorTile: simpleBlueColor,
                  textCode: "first_floor",
                  onTapFunction: () => pageController.animateToPage(
                        2,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 650),
                      )),
              GridTileClassic(
                  colorTile: lightBlueColor,
                  textCode: "second_floor",
                  onTapFunction: () => pageController.animateToPage(
                        3,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 650),
                      )),
            ],
          ),
          Container(
            child: Arrow(
              onPressed: () {
                pageController.animateToPage(
                  1,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 650),
                );
              },
              isForward: true,
            ),
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
