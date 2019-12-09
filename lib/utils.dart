import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

void _showSimpleDialog(BuildContext context, String text, Function onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(
          text,
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
                  color: darkBlueColor,
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
                      color: darkBlueColor,
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
                      color: darkBlueColor,
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
                  color: darkBlueColor,
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
                      color: darkBlueColor,
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
                      color: darkBlueColor,
                      fontFamily: 'Gotham',
                    ),
                  ),
                ),
              ],
            );
    },
  );
}
