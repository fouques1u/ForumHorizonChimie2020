import 'package:flutter/material.dart';

import '../colors.dart';

class OutlineButtonClassic extends StatelessWidget {
  final String text;
  final Function action;

  OutlineButtonClassic({@required this.text, @required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 5,
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(color: simpleBlueColor),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(255, 255, 255, 0.9),
              Colors.white,
              Color.fromRGBO(255, 255, 255, 0.9),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
      ),
      onTap: () => action(),
    );
  }
}
