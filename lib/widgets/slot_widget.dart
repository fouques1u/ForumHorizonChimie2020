import 'package:flutter/material.dart';

import '../colors.dart';

class SlotWidget extends StatelessWidget {
  final String nom;
  final String prenom;
  final String horaire;

  SlotWidget({this.nom, this.prenom, this.horaire});

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
                    horaire, // TODO : put the right stand for the pictures.
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gotham',
                      fontSize: 11,
                    ),
                  )
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
            onTap: () {},
          )
        ],
      ),
    );
  }
}
