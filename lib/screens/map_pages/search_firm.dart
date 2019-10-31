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
    return Container(
      decoration: BoxDecoration(
        /*
        image: DecorationImage(
            image: AssetImage('assets/images/forum-apercu.jpg'),
            fit: BoxFit.none),
            */
        color: Colors.black,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ClassicPageTitle(title: 'search_firm'),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(15)),
            child: TextField(
              controller: _filter,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).translate('search_firm'),
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
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
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
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  GridTileClassic(
                      colorTile: darkBlueColor,
                      textCode: "ground_floor",
                      onTapFunction: () => widget.pageController.animateToPage(
                            1,
                            curve: Curves.ease,
                            duration: Duration(milliseconds: 650),
                          )),
                  SizedBox(width: 10),
                  GridTileClassic(
                      colorTile: simpleBlueColor,
                      textCode: "first_floor",
                      onTapFunction: () => widget.pageController.animateToPage(
                            2,
                            curve: Curves.ease,
                            duration: Duration(milliseconds: 650),
                          )),
                  SizedBox(width: 10),
                  GridTileClassic(
                      colorTile: lightBlueColor,
                      textCode: "second_floor",
                      onTapFunction: () => widget.pageController.animateToPage(
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
    );
  }
}
