import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forum_horizon_chimie/data.dart';
import 'dart:io';

import '../app_localizations.dart';
import '../colors.dart';
import '../utils.dart';

class SlotWidget extends StatelessWidget {
  final String nom;
  final String prenom;
  final String horaire;
  final Function onConfirimCreneauDelete;

  SlotWidget({this.nom, this.prenom, this.horaire,  this.onConfirimCreneauDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
            blurRadius: 15.0,
            spreadRadius: 0.0,
            color: darkBlueColor,
          )
        ],
        shape: BoxShape.rectangle,
        color: darkBlueColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.check_box,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    prenom + ' ' + nom,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gotham',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    horaire,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gotham',
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
            onTap: () {
              showDialogWithConfirmation(
                context: context,
                dialogTitle: AppLocalizations.of(context)
                    .translate('dialog_cv_delete_title'),
                dialogText: AppLocalizations.of(context)
                    .translate('dialog_cv_delete_text'),
                dialogConfirm: AppLocalizations.of(context)
                    .translate('dialog_cv_delete_confirm'),
                dialogCancel: AppLocalizations.of(context)
                    .translate('dialog_cv_delete_cancel'),
                dialogConfirmAction: () => deleteCreneau(horaire, {'deviceId' : deviceId, 'nom' : nom, 'prenom' : prenom}),
                dialogTestBeforeConfirmation: true,
                confirmError: AppLocalizations.of(context).translate("cv_delete_error"),
                confirmSuccess: AppLocalizations.of(context).translate("cv_delete_success"),
                onConfirm: () => onConfirimCreneauDelete(),
              );
            },
          )
        ],
      ),
    );
  }
}
