import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/app_localizations.dart';
import 'package:forum_horizon_chimie/widgets/arrow.dart';

import '../../widgets/grid_tile_classic.dart';
import '../../widgets/page_title_classic.dart';
import '../../colors.dart';
import '../../data.dart';

class SearchFirmPage extends StatefulWidget {
  final PageController pageController;

  SearchFirmPage({@required this.pageController});

  @override
  _SearchFirmPageState createState() => _SearchFirmPageState();
}

class _SearchFirmPageState extends State<SearchFirmPage> {
  final TextEditingController _filter = TextEditingController();
  List<String> _names = List(); // names we get from API
  List<String> _filteredNames = List(); // names filtered by search text

  onSearchTextChanged(String text) async {
    _filteredNames.clear();

    if (text.isEmpty) {
      return;
    }

    text.toLowerCase();

    _names.forEach((name) {
      if (name == null) return;

      String copy = name;

      if (copy.toLowerCase().contains(text)) {
        setState(() {
          _filteredNames.add(name);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _names = getFirmsNames();

    onSearchTextChanged("");
  }

  Widget buildFloorButtons(
      {BuildContext context,
      Function onTapFunction,
      Icon icon,
      String textCode,
      Color colorTile}) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              AppLocalizations.of(context).translate(textCode),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Gotham',
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            color: colorTile,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: colorTile,
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/img_2_gradient.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ClassicPageTitle(title: 'search_firm'),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(15, 10, 15, 30),
              decoration: BoxDecoration(
                color: simpleBlueColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    spreadRadius: 0.0,
                    color: darkBlueColor,
                  )
                ],
                gradient: LinearGradient(
                  colors: <Color>[
                    simpleBlueColor,
                    darkBlueColor,
                  ],
                  end: Alignment.topLeft,
                  begin: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(15)),
                    child: TextField(
                      controller: _filter,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)
                            .translate('search_firm'),
                        hintStyle: Theme.of(context).textTheme.body2,
                        prefixIcon: Icon(
                          Icons.search,
                          color: darkBlueColor,
                        ),
                      ),
                      onChanged: (String text) => onSearchTextChanged(text),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: _filteredNames.length == 0
                          ? [
                              Text(
                                  AppLocalizations.of(context)
                                      .translate("no_firms_found"),
                                  style: Theme.of(context).textTheme.body2)
                            ]
                          : _filteredNames
                              .map((String name) {
                                return FutureBuilder(
                                  future: getStandFirmByName(name),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.none ||
                                        snapshot.connectionState ==
                                            ConnectionState.waiting ||
                                        snapshot.data == null) {
                                      return ListTile(
                                        title: Text(name),
                                      );
                                    }

                                    String _standNumber = snapshot.data;

                                    return ListTile(
                                      title: Text(name),
                                      subtitle: Text('Stand : ' + _standNumber),
                                      onTap: () {
                                        if (_standNumber.length == 3) {
                                          // Second floor
                                          if (_standNumber.startsWith("2")) {
                                            widget.pageController.animateToPage(
                                              3,
                                              curve: Curves.ease,
                                              duration:
                                                  Duration(milliseconds: 650),
                                            );
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          }
                                          // First floor
                                          if (_standNumber.startsWith("1")) {
                                            widget.pageController.animateToPage(
                                              2,
                                              curve: Curves.ease,
                                              duration:
                                                  Duration(milliseconds: 650),
                                            );
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          }
                                        }
                                        // Ground floor
                                        else {
                                          widget.pageController.animateToPage(
                                            1,
                                            curve: Curves.ease,
                                            duration:
                                                Duration(milliseconds: 650),
                                          );
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        }
                                      },
                                    );
                                  },
                                );
                              })
                              .take(5)
                              .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildFloorButtons(
                    context: context,
                    colorTile: darkBlueColor,
                    icon: Icon(
                      Icons.filter_1,
                      color: Colors.white,
                    ),
                    textCode: "ground_floor",
                    onTapFunction: () {
                      widget.pageController.animateToPage(
                        1,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 650),
                      );
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                  SizedBox(height: 15),
                  buildFloorButtons(
                    context: context,
                    colorTile: simpleBlueColor,
                    icon: Icon(
                      Icons.filter_2,
                      color: Colors.white,
                    ),
                    textCode: "first_floor",
                    onTapFunction: () {
                      widget.pageController.animateToPage(
                        2,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 650),
                      );
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                  SizedBox(height: 15),
                  buildFloorButtons(
                    context: context,
                    colorTile: lightBlueColor,
                    icon: Icon(
                      Icons.filter_3,
                      color: Colors.white,
                    ),
                    textCode: "second_floor",
                    onTapFunction: () {
                      widget.pageController.animateToPage(
                        3,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 650),
                      );
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Arrow(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  widget.pageController.animateToPage(
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
      ),
    );
  }
}
