import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_localizations.dart';
import 'colors.dart';

void _showSimpleDialog(BuildContext context, String text, Function onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(
          text,
          style: TextStyle(fontFamily: 'Gotham', color: colorFour),
        ),
        children: <Widget>[
          SimpleDialogOption(
            child: Text(
              'OK',
              style: TextStyle(
                fontFamily: 'Gotham',
                color: colorFour,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
          )
        ],
      );
    },
  );
}

void showDialogWithConfirmation({
  @required BuildContext context,
  @required String dialogTitle,
  @required String dialogText,
  @required String dialogConfirm,
  @required String dialogCancel,
  @required Function dialogConfirmAction,
  @required bool dialogTestBeforeConfirmation,
  @required String confirmSuccess,
  @required String confirmError,
  @required Function onConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Platform.isAndroid
          ? AlertDialog(
              title: Text(
                dialogTitle,
                style: TextStyle(
                  color: colorFour,
                  fontFamily: 'Gotham',
                ),
              ),
              content: Text(
                dialogText,
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
                    dialogCancel,
                    style: TextStyle(
                      color: colorFour,
                      fontFamily: 'Gotham',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (dialogTestBeforeConfirmation) {
                      dialogConfirmAction();
                      _showSimpleDialog(context, confirmSuccess, onConfirm);
                    } else {
                      _showSimpleDialog(context, confirmError, onConfirm);
                    }
                  },
                  child: Text(
                    dialogConfirm,
                    style: TextStyle(
                      color: colorFour,
                      fontFamily: 'Gotham',
                    ),
                  ),
                ),
              ],
            )
          : CupertinoAlertDialog(
              title: Text(
                dialogTitle,
                style: TextStyle(
                  color: colorFour,
                  fontFamily: 'Gotham',
                ),
              ),
              content: Text(
                dialogText,
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
                    dialogCancel,
                    style: TextStyle(
                      color: colorFour,
                      fontFamily: 'Gotham',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (dialogTestBeforeConfirmation) {
                      dialogConfirmAction();
                      _showSimpleDialog(context, confirmSuccess, onConfirm);
                    } else {
                      _showSimpleDialog(context, confirmError, onConfirm);
                    }
                  },
                  child: Text(
                    dialogConfirm,
                    style: TextStyle(
                      color: colorFour,
                      fontFamily: 'Gotham',
                    ),
                  ),
                ),
              ],
            );
    },
  );
}

void showLargeBottomSheet(BuildContext context) {
  showBottomSheet(
    builder: (BuildContext context) {
      return Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: colorOne,
              ),
            ],
            color: colorOne,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('president_word_title'),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gotham',
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context).translate('president_word_text'),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gotham',
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context).translate("thanks"),
                  style: Theme.of(context).textTheme.bodyText2.apply(color: colorOne),
                ),
              )
            ],
          ),
        ),
      );
    },
    context: context,
  );
}
