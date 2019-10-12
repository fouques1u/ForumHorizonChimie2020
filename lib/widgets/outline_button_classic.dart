import 'package:flutter/material.dart';

import '../colors.dart';

class OutlineButtonClassic extends StatelessWidget {
  final String text;
  final Function action;

  OutlineButtonClassic({@required this.text, @required this.action});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: OutlineButton(
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(color: lightBlueColor),
          ),
        ),
        onPressed: () => action(),
        borderSide: BorderSide(color: lightBlueColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
