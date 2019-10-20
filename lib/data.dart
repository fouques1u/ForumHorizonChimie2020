import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

List<Map<String, Object>> firmsData = [];

void getFirms() async {
  firmsData = [];

  List<DocumentSnapshot> data = await Firestore.instance
      .collection('firms')
      .getDocuments()
      .then((QuerySnapshot querySnapshot) {
    return querySnapshot.documents;
  });
  
  data.forEach((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.data.isNotEmpty) {
      Map<String, Object> newMap = {
        'nom': documentSnapshot.data['nom'],
        'stand': documentSnapshot.data['stand'],
      };
      firmsData.add(newMap);
    }
  });
}
