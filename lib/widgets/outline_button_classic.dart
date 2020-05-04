import 'package:flutter/material.dart';

import '../colors.dart';

class OutlineButtonClassic extends StatelessWidget {
  final String text;
  final Function action;
  final Function longPressAction;

  OutlineButtonClassic({@required this.text, @required this.action, @required this.longPressAction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: colorTwo,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 5,
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(color: colorTwo),
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
      onLongPress: () => longPressAction(),
    );
  }
}
