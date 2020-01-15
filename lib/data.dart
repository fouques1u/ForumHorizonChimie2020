import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  '210',
];
List<Map<String, Object>> listCreneaux = [];
List<String> listCreneauxId = [];
List<Map<String, String>> conferencesData = [];
List<String> conferencesId = [];
String deviceId;
const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
final String defaultDeviceId = getRandomString(20);
//final StorageReference storageReference = FirebaseStorage().ref().child('gs://forumhorizonchimie-3d3a8.appspot.com/');
final String isShownId = 'IS_SHOWN_ID';

String getRandomString(int strlen) {
  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < strlen; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

Future<Null> getDeviceId() async {
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

  return null;
}

Future<Null> getFirms() async {
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
        'description_fr': documentSnapshot.data['description_fr'],
        'description_en': documentSnapshot.data['description_en'],
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

  return null;
}

Future<Map<String, String>> getStandInformations(String stand) async {
  await getFirms();

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

Future<String> getStandFirmByName(String nom) async {
  await getFirms();

  return firmsData.firstWhere((Map<String, String> map) {
    return map['nom'] == nom;
  })['stand'];
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

  if (creneauToUpdate.data['dispo'] == 3) {
    Map<String, Object> newMap = {
      "horaire": creneauToUpdate.data['horaire'],
      "nom_1": map['nom'],
      "prenom_1": map['prenom'],
      "deviceId_1": map['deviceId'],
      "nom_2": creneauToUpdate.data['horaire'],
      "prenom_2": creneauToUpdate.data['horaire'],
      "deviceId_2": creneauToUpdate.data['horaire'],
      "nom_3": creneauToUpdate.data['horaire'],
      "prenom_3": creneauToUpdate.data['horaire'],
      "deviceId_3": creneauToUpdate.data['horaire'],
      "dispo": 2
    };

    await Firestore.instance
        .collection('creneaux_cv')
        .document(creneauToUpdate.documentID)
        .updateData(newMap);

    Map<String, Object> creneauInList =
        listCreneaux.firstWhere((Map<String, Object> localMap) {
      return map['horaire'] == localMap['horaire'];
    });

    listCreneaux.remove(creneauInList);
    listCreneaux.add(newMap);
  }
  if (creneauToUpdate.data['dispo'] == 2) {
    Map<String, Object> newMap = {
      "horaire": creneauToUpdate.data['horaire'],
      "nom_2": map['nom'],
      "prenom_2": map['prenom'],
      "deviceId_2": map['deviceId'],
      "nom_1": creneauToUpdate.data['nom_1'],
      "prenom_1": creneauToUpdate.data['prenom_1'],
      "deviceId_1": creneauToUpdate.data['deviceId_1'],
      "nom_3": creneauToUpdate.data['nom_3'],
      "prenom_3": creneauToUpdate.data['prenom_3'],
      "deviceId_3": creneauToUpdate.data['deviceId_3'],
      "dispo": 1
    };

    await Firestore.instance
        .collection('creneaux_cv')
        .document(creneauToUpdate.documentID)
        .updateData(newMap);

    Map<String, Object> creneauInList =
        listCreneaux.firstWhere((Map<String, Object> localMap) {
      return map['horaire'] == localMap['horaire'];
    });

    listCreneaux.remove(creneauInList);
    listCreneaux.add(newMap);
  }
  if (creneauToUpdate.data['dispo'] == 1) {
    Map<String, Object> newMap = {
      "horaire": creneauToUpdate.data['horaire'],
      "nom_3": map['nom'],
      "prenom_3": map['prenom'],
      "deviceId_3": map['deviceId'],
      "nom_2": creneauToUpdate.data['nom_2'],
      "prenom_2": creneauToUpdate.data['prenom_2'],
      "deviceId_2": creneauToUpdate.data['deviceId_2'],
      "nom_1": creneauToUpdate.data['nom_1'],
      "prenom_1": creneauToUpdate.data['prenom_1'],
      "deviceId_1": creneauToUpdate.data['deviceId_1'],
      "dispo": 0
    };

    await Firestore.instance
        .collection('creneaux_cv')
        .document(creneauToUpdate.documentID)
        .updateData(newMap);

    Map<String, Object> creneauInList =
        listCreneaux.firstWhere((Map<String, Object> localMap) {
      return map['horaire'] == localMap['horaire'];
    });

    listCreneaux.remove(creneauInList);
    listCreneaux.add(newMap);
  }
}

List<String> getAvailableCreneaux() {
  getCreneaux();

  List<String> res = [];

  listCreneaux.forEach((Map<String, Object> map) {
    int dispo = map['dispo'];

    if (dispo > 0) {
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

  int dispo = creneau['dispo'];

  return dispo > 0;
}

// Good way to use future.
Future<List<Map<String, String>>> getCreneauxSaved() async {
  List<DocumentSnapshot> _data = await getSnapshot('creneaux_cv');

  List<Map<String, String>> _returnValue = [];

  _data.forEach((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.data.isNotEmpty) {
      if (documentSnapshot.data["deviceId_1"] == deviceId) {
        _returnValue.add({
          "horaire": documentSnapshot.data["horaire"],
          "nom": documentSnapshot.data["nom_1"],
          "prenom": documentSnapshot.data["prenom_1"]
        });
      }
      if (documentSnapshot.data["deviceId_2"] == deviceId) {
        _returnValue.add({
          "horaire": documentSnapshot.data["horaire"],
          "nom": documentSnapshot.data["nom_2"],
          "prenom": documentSnapshot.data["prenom_2"]
        });
      }
      if (documentSnapshot.data["deviceId_3"] == deviceId) {
        _returnValue.add({
          "horaire": documentSnapshot.data["horaire"],
          "nom": documentSnapshot.data["nom_3"],
          "prenom": documentSnapshot.data["prenom_3"]
        });
      }
    }
  });

  return _returnValue;
}

void deleteCreneau(String horaire) async {
  Map<String, Object> newMap = {
    "horaire": horaire,
    "nom_1": "",
    "prenom_1": "",
    "deviceId_1": "",
    "nom_2": "",
    "prenom_2": "",
    "deviceId_2": "",
    "nom_3": "",
    "prenom_3": "",
    "deviceId_3": "",
    "dispo": 3
  };

  List<DocumentSnapshot> data = await getSnapshot('creneaux_cv');

  final DocumentSnapshot creneauToUpdate =
      data.firstWhere((DocumentSnapshot documentSnapshot) {
    return documentSnapshot.data['horaire'] == newMap['horaire'];
  });

  await Firestore.instance
        .collection('creneaux_cv')
        .document(creneauToUpdate.documentID)
        .updateData(newMap);

    Map<String, Object> creneauInList =
        listCreneaux.firstWhere((Map<String, Object> localMap) {
      return newMap['horaire'] == localMap['horaire'];
    });

    listCreneaux.remove(creneauInList);
    listCreneaux.add(newMap);
}

void getConferences() async {
  List<DocumentSnapshot> data = await Firestore.instance
      .collection('conferences')
      .getDocuments()
      .then((QuerySnapshot querySnapshot) {
    return querySnapshot.documents;
  });

  data.forEach((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.data.isNotEmpty) {
      Map<String, String> newMap = {
        'sujet_fr': documentSnapshot.data['sujet_fr'],
        'organisme': documentSnapshot.data['organisme'],
        'intervenant': documentSnapshot.data['intervenant'],
        'horaire': documentSnapshot.data['horaire'],
        'description_fr': documentSnapshot.data['description_fr'],
        'sujet_en': documentSnapshot.data['sujet_en'],
        'description_en': documentSnapshot.data['description_en']
      };
      if (!conferencesId.contains(documentSnapshot.documentID)) {
        conferencesData.add(newMap);
        conferencesId.add(documentSnapshot.documentID);
      }
    }
  });
}
