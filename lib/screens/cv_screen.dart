import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/widgets/slot_widget.dart';
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
  List<String> _creneaux = getAvailableCreneaux();

  String nom = "";
  String prenom = "";
  String horaire = "";

  void showSimpleDialog(BuildContext context, String textCode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            AppLocalizations.of(context).translate(textCode),
            style: TextStyle(fontFamily: 'Gotham', color: darkBlueColor),
          ),
          children: <Widget>[
            SimpleDialogOption(
              child: Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Gotham',
                  color: darkBlueColor,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {});
              },
            )
          ],
        );
      },
    );
  }

  Widget buildForm(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          // Textfields
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
          // GridView
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.3,
            child: RefreshIndicator(
              backgroundColor: white,
              color: darkBlueColor,
              child: GridView.count(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                childAspectRatio: 4,
                children: _creneaux.map((String creneau) {
                  return OutlineButtonClassic(
                    text: creneau,
                    action: () {
                      setState(() {
                        horaire = creneau;
                      });
                    },
                    longPressAction: () {},
                  );
                }).toList(),
              ),
              onRefresh: () {
                Future<void> result = getCreneaux();

                setState(() {
                  _creneaux = getAvailableCreneaux();
                });

                return result;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Creneau résumé.
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
                Text( AppLocalizations.of(context).translate('surname')+" : $prenom",
                    style: Theme.of(context).textTheme.body1),
                Text(AppLocalizations.of(context).translate('name')+" : $nom", style: Theme.of(context).textTheme.body1),
                Text(horaire, style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),
          // Confirmer
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
                    'deviceId': deviceId,
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
                          content: Text(
                              AppLocalizations.of(context)
                                      .translate('dialog_cv_text') +
                                  '\n$nom\n$prenom\n$horaire',
                              style: TextStyle(
                                fontFamily: 'Gotham',
                              )),
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
                                if (checkCreneauAvailability(horaire)) {
                                  updateCreneau(mapToUpdate);
                                  showSimpleDialog(
                                      context, 'dialog_confirmation_toast');
                                } else {
                                  showSimpleDialog(
                                      context, 'toast_unable_save_creneau');
                                }
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
                                  color: darkBlueColor, fontFamily: 'Gotham')),
                          content: Text(
                            AppLocalizations.of(context)
                                    .translate('dialog_cv_text') +
                                "\n$nom\n$prenom\n$horaire",
                            style: TextStyle(
                              fontFamily: 'Gotham',
                            ),
                          ),
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
                                if (checkCreneauAvailability(horaire)) {
                                  updateCreneau(mapToUpdate);
                                  showSimpleDialog(
                                      context, 'dialog_confirmation_toast');
                                } else {
                                  showSimpleDialog(
                                      context, 'toast_unable_save_creneau');
                                }
                              },
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('dialog_cv_confirm'),
                                style: TextStyle(
                                    color: darkBlueColor, fontFamily: 'Gotham'),
                              ),
                            )
                          ],
                        );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildSlotWidgetStreamBuilder() {
    return FutureBuilder(
      future: getCreneauxSaved(),
      builder: (context, snapshot) {
        if (snapshot.hasData != null &&
            (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done)) {
          List<Map<String, String>> requestResult = snapshot.data;
          return Column(
            children: requestResult.map((Map<String, String> creneau) {
              return SlotWidget(
                nom: creneau["nom"],
                prenom: creneau["prenom"],
                horaire: creneau["horaire"],
                onConfirimCreneauDelete: () => setState(() {}),
              );
            }).toList(),
          );
        } else {
          return Center();
        }
      },
    );
  }

  Widget buildAttenteWidget() {
    return FutureBuilder(
      future: getAttente(),
      builder: (context, snapshot) {
        if (snapshot.hasData != null &&
            (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done)) {
          String requestResult = snapshot.data;

          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  spreadRadius: 0.0,
                  color: lightGreenColor,
                )
              ],
              shape: BoxShape.rectangle,
              color: lightGreenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(AppLocalizations.of(context).translate('attente')+requestResult+' min', style: Theme.of(context).textTheme.body1.apply(color: Colors.white)),
          );
        } else {
          return Center();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/img_1_gradient.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            ClassicPageTitle(
              title: 'reserve_photo_cv',
            ),
            buildSlotWidgetStreamBuilder(),
            SizedBox(
              height: 10,
            ),
            buildAttenteWidget(),
            SizedBox(height: 10,),
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
                  buildForm(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
