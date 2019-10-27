import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  final Function onPressed;
  final bool isForward;

  Arrow({@required this.onPressed, @required this.isForward});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 4,
      onPressed: () => onPressed(),
      child: Icon(isForward ? Icons.arrow_forward : Icons.arrow_back),
    );
  }
}
