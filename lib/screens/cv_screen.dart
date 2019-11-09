import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../colors.dart';
import '../data.dart';
import '../widgets/outline_button_classic.dart';
import '../widgets/page_title_classic.dart';
import '../app_localizations.dart';

class CvScreen extends StatefulWidget {
  @override
  _CvScreenState createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  List<String> creneaux = getAvailableCreneaux();

  String nom = "";
  String prenom = "";
  String horaire = "";

  Widget buildForm(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.body1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: AppLocalizations.of(context).translate('surname'),
              hintStyle: TextStyle(
                color: Colors.white70,
                fontFamily: 'Gotham',
                fontSize: 14,
              ),
              labelText: AppLocalizations.of(context).translate('surname'),
              labelStyle: TextStyle(
                color: Colors.white70,
                fontFamily: 'Gotham',
                fontSize: 14,
              ),
            ),
            onSubmitted: (String textInput) {
              setState(() {
                prenom = textInput;
              });
            },
            onChanged: (String textInput) {
              setState(() {
                prenom = textInput;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: Theme.of(context).textTheme.body1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: AppLocalizations.of(context).translate('name'),
              hintStyle: TextStyle(
                color: Colors.white70,
                fontFamily: 'Gotham',
                fontSize: 14,
              ),
              labelText: AppLocalizations.of(context).translate('name'),
              labelStyle: TextStyle(
                color: Colors.white70,
                fontFamily: 'Gotham',
                fontSize: 14,
              ),
            ),
            onSubmitted: (String textInput) {
              setState(() {
                nom = textInput;
              });
            },
            onChanged: (String textInput) {
              setState(() {
                nom = textInput;
              });
            },
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Text(
              AppLocalizations.of(context).translate('available_dates'),
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
            child: GridView.count(
                padding: EdgeInsets.all(5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                childAspectRatio: 4,
                children: creneaux.map((String creneau) {
                  return OutlineButtonClassic(
                    text: creneau,
                    action: () {
                      setState(() {
                        horaire = creneau;
                      });
                    },
                    longPressAction: () {},
                  );
                }).toList()),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2, color: Colors.white),
                bottom: BorderSide(width: 2, color: Colors.white),
                right: BorderSide(width: 2, color: Colors.white),
                left: BorderSide(width: 2, color: Colors.white),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Prenom : $prenom",
                    style: Theme.of(context).textTheme.body1),
                Text("Nom : $nom", style: Theme.of(context).textTheme.body1),
                Text(horaire, style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                AppLocalizations.of(context).translate('confirm'),
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: lightGreenColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: lightBlueColor,
                      blurRadius: 5,
                    ),
                  ]),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    final mapToUpdate = {
                      'dispo': false,
                      'horaire': horaire,
                      'nom': nom,
                      'prenom': prenom
                    };

                    return Platform.isAndroid
                        ? AlertDialog(
                            title: Text(
                              AppLocalizations.of(context)
                                  .translate('dialog_cv_title'),
                              style: TextStyle(
                                  color: darkBlueColor, fontFamily: 'Gotham'),
                            ),
                            content: Text(AppLocalizations.of(context)
                                    .translate('dialog_cv_text') +
                                '\n$nom\n$prenom\n$horaire',style: TextStyle(fontFamily: 'Gotham',)),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)
                                          .translate('dialog_cv_cancel'),
                                      style: TextStyle(
                                          color: darkBlueColor,
                                          fontFamily: 'Gotham'))),
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  updateCreneau(mapToUpdate);
                                },
                                child: Text(
                                    AppLocalizations.of(context)
                                        .translate('dialog_cv_confirm'),
                                    style: TextStyle(
                                        color: darkBlueColor,
                                        fontFamily: 'Gotham')),
                              )
                            ],
                          )
                        : CupertinoAlertDialog(
                            title: Text(
                                AppLocalizations.of(context)
                                    .translate('dialog_cv_title'),
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontFamily: 'Gotham')),
                            content: Text(AppLocalizations.of(context)
                                    .translate('dialog_cv_text') +
                                "\n$nom\n$prenom\n$horaire",style: TextStyle(fontFamily: 'Gotham',),),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)
                                          .translate('dialog_cv_cancel'),
                                      style: TextStyle(
                                          color: darkBlueColor,
                                          fontFamily: 'Gotham'))),
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  updateCreneau(mapToUpdate);
                                },
                                child: Text(
                                    AppLocalizations.of(context)
                                        .translate('dialog_cv_confirm'),
                                    style: TextStyle(
                                        color: darkBlueColor,
                                        fontFamily: 'Gotham')),
                              )
                            ],
                          );
                  });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            ClassicPageTitle(
              title: 'reserve_photo_cv',
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(15, 10, 15, 30),
              decoration: BoxDecoration(
                color: simpleBlueColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: lightBlueColor,
                  ),
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
              child: buildForm(context),
            ),
          ],
        ),
      ),
    );
  }
}
