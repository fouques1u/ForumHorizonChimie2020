import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

List<Map<String, String>> firmsData = [];
List<String> firmsId = [];
List<String> listStands = const [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '20',
  '20bis',
  '21',
  '23',
  '25',
  '26',
  '27',
  '28',
  '29',
  'handicafe',
  '101',
  '102',
  '103',
  '104',
  '105',
  '106',
  '106bis',
  '107',
  '108',
  '109',
  '110',
  '111',
  '112',
  '113',
  '115',
  '116',
  '117',
  '201',
  '202',
  '203',
  '204',
  '205',
  '206',
  '207',
  '208',
  '209',
  '210'
];
List<Map<String, Object>> listCreneaux = [];
List<String> listCreneauxId = [];
String deviceId;
const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
final String defaultDeviceId = getRandomString(20);

String getRandomString(int strlen) {
  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < strlen; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

void getDeviceId() async {
  DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
    deviceId = androidInfo.fingerprint;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
    deviceId = iosDeviceInfo.identifierForVendor;
  } else {
    deviceId = defaultDeviceId;
  }
}

void getFirms() async {
  List<DocumentSnapshot> data = await Firestore.instance
      .collection('firms')
      .getDocuments()
      .then((QuerySnapshot querySnapshot) {
    return querySnapshot.documents;
  });

  data.forEach((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.data.isNotEmpty) {
      Map<String, String> newMap = {
        'nom': documentSnapshot.data['nom'],
        'stand': documentSnapshot.data['stand'],
        'description': documentSnapshot.data['description'],
        'facebook_url': documentSnapshot.data['facebook_url'],
        'old_facebook_url': documentSnapshot.data['old_facebook_url'],
        'linkedin_url': documentSnapshot.data['linkedin_url'],
        'twitter_url': documentSnapshot.data['twitter_url'],
        'web_url': documentSnapshot.data['web_url'],
      };
      if (!firmsId.contains(documentSnapshot.documentID)) {
        firmsData.add(newMap);
        firmsId.add(documentSnapshot.documentID);
      }
    }
  });
}

Map<String, String> getStandInformations(String stand) {
  getFirms();

  return firmsData.firstWhere((Map<String, String> element) {
    return element['stand'] == stand;
  });
}

List<String> getFirmsNames() {
  getFirms();

  List<String> result = new List();

  firmsData.forEach((Map<String, String> map) {
    result.add(map['nom']);
  });

  return result;
}

Future<List<DocumentSnapshot>> getSnapshot(String collection) async {
  return await Firestore.instance
      .collection(collection)
      .getDocuments()
      .then((QuerySnapshot querySnapshot) {
    return querySnapshot.documents;
  });
}

Future<Null> getCreneaux() async {
  List<DocumentSnapshot> data = await getSnapshot('creneaux_cv');

  data.forEach((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.data.isNotEmpty) {
      Map<String, Object> newMap = {
        'dispo': documentSnapshot.data['dispo'],
        'horaire': documentSnapshot.data['horaire'],
        'nom': documentSnapshot.data['nom'],
        'prenom': documentSnapshot.data['prenom'],
      };
      if (!listCreneauxId.contains(documentSnapshot.documentID)) {
        listCreneaux.add(newMap);
        listCreneauxId.add(documentSnapshot.documentID);
      }
    }
  });

  return null;
}

void updateCreneau(Map<String, Object> map) async {
  List<DocumentSnapshot> data = await getSnapshot('creneaux_cv');

  final DocumentSnapshot creneauToUpdate =
      data.firstWhere((DocumentSnapshot documentSnapshot) {
    return documentSnapshot.data['horaire'] == map['horaire'];
  });

  await Firestore.instance
      .collection('creneaux_cv')
      .document(creneauToUpdate.documentID)
      .updateData(map);

  Map<String, Object> creneauInList =
      listCreneaux.firstWhere((Map<String, Object> localMap) {
    return map['horaire'] == localMap['horaire'];
  });

  listCreneaux.remove(creneauInList);
  listCreneaux.add(map);
}

List<String> getAvailableCreneaux() {
  getCreneaux();

  List<String> res = [];

  listCreneaux.forEach((Map<String, Object> map) {
    if (map['dispo']) {
      res.add(map['horaire']);
    }
  });

  res.sort();

  return res;
}

bool checkCreneauAvailability(String horaire) {
  getCreneaux();

  Map<String, Object> creneau =
      listCreneaux.firstWhere((Map<String, Object> map) {
    return map['horaire'] == horaire;
  });

  return creneau['dispo'];
}

// Good way to use future.
Future<List<Map<String, String>>> getCreneauxSaved() async {
  List<DocumentSnapshot> _data = await getSnapshot('creneaux_cv');

  List<Map<String, String>> _returnValue = [];

  _data.forEach((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.data.isNotEmpty) {
      if (documentSnapshot.data["deviceId"] == deviceId) {
        _returnValue.add({
          "horaire": documentSnapshot.data["horaire"],
          "nom": documentSnapshot.data["nom"],
          "prenom": documentSnapshot.data["prenom"]
        });
      }
    }
  });

  return _returnValue;
}

void deleteCreneau(String horaire) async {
  Map<String,Object> creneauToDelete = {
    "horaire" : horaire,
    "nom" : "",
    "prenom" : "",
    "deviceId" : "", 
    "dispo" : true
  };
  updateCreneau(creneauToDelete);
}