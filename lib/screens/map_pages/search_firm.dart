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
  final TextEditingController _filter = new TextEditingController();
  List<String> _names = new List(); // names we get from API
  List<String> _filteredNames = new List(); // names filtered by search text

  onSearchTextChanged(String text) async {
    _filteredNames.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _names.forEach((name) {
      if (name.contains(text))
        setState(() {
          _filteredNames.add(name);
        });
    });
  }

  @override
  void initState() {
    super.initState();

    _names = getFirmsNames();

    onSearchTextChanged("");
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
                    color: lightBlueColor,
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
                      children: _filteredNames.length < 5
                          ? (_filteredNames.length == 0
                              ? [
                                  Text(
                                      AppLocalizations.of(context)
                                          .translate("no_firms_found"),
                                      style: Theme.of(context).textTheme.body2)
                                ]
                              : _filteredNames.map((String name) {
                                  return new ListTile(
                                    title: Text(name),
                                    onTap: () => print(name),
                                  );
                                }).toList())
                          : _filteredNames
                              .map((String name) {
                                return new ListTile(
                                  title: Text(name),
                                  onTap: () => print(name),
                                );
                              })
                              .toList()
                              .sublist(0, 5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                child: Row(
                  children: <Widget>[
                    GridTileClassic(
                        height: 40,
                        colorTile: darkBlueColor,
                        textCode: "ground_floor",
                        onTapFunction: () =>
                            widget.pageController.animateToPage(
                              1,
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 650),
                            )),
                    SizedBox(width: 10),
                    GridTileClassic(
                        height: 40,
                        colorTile: simpleBlueColor,
                        textCode: "first_floor",
                        onTapFunction: () =>
                            widget.pageController.animateToPage(
                              2,
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 650),
                            )),
                    SizedBox(width: 10),
                    GridTileClassic(
                        height: 40,
                        colorTile: lightBlueColor,
                        textCode: "second_floor",
                        onTapFunction: () =>
                            widget.pageController.animateToPage(
                              3,
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 650),
                            )),
                  ],
                ),
              ),
            ),
            Container(
              child: Arrow(
                onPressed: () {
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
