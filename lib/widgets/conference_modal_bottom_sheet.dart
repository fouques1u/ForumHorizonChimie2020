import 'package:flutter/material.dart';

class ConferenceModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Text(
            'Title',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 24,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Horaire : 10:00-11:15',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Description.',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          
        ],
      ),
    );
  }
}