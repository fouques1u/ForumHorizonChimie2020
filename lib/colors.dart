
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Color>> getColors() async {
  List<DocumentSnapshot> data = await Firestore.instance
      .collection('couleur')
      .getDocuments()
      .then((QuerySnapshot querySnapshot) {
    return querySnapshot.documents;
  });

  data.sort((s1, s2) {
    return s1.documentID.compareTo(s2.documentID);
  });

  List<Color> result = data.map((DocumentSnapshot snapshot) {
    return Color.fromRGBO(snapshot.data['red'], snapshot.data['green'], snapshot.data['blue'], 1);
  }).toList();

  colorFour = result[3];
  colorThree = result[2];
  colorTwo = result[1];
  colorOne = result[0];

  return result;
}

Color colorFour = Color.fromRGBO(45, 53, 141, 1);
Color colorThree = Color.fromRGBO(52, 126, 179, 1);
Color colorTwo = Color.fromRGBO(101, 203, 218, 1);
Color colorOne = Color.fromRGBO(84, 196, 164, 1);

const white = Colors.white;

const double titleTextSize = 22;
const double tileTextSize = 20;
const double normalTextSize = 16;