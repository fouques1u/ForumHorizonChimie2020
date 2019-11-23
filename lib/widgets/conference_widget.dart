import 'package:flutter/material.dart';

import '../colors.dart';

class ConferenceWidget extends StatelessWidget {
  final Function onTapFunction;

  ConferenceWidget({@required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapFunction(),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(10),
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
              color: lightBlueColor,
              //offset: Offset.fromDirection(1),  See nike shop speed code vid.
            )
          ],
          shape: BoxShape.rectangle,
          color: darkBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.mic,
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
                  "Conférence 'Elles bougent'",
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
                  "10:00 - 11:15 ; Salle 105.",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gotham',
                    fontSize: 11,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
