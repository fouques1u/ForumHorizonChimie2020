import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forum_horizon_chimie/colors.dart';

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

List<Map<String,Object>> listCreneaux = [];
List<String> listCreneauxId = [];

/*
void addCreneaux() async {
  List<String> listCreneaux = ['9:00', '9:05', '9:10', '9:15', '9:20', '9:25', '9:30', '9:35', '9:40', '9:45', '9:50', '9:55', '10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55'];
  final db = Firestore.instance;
  listCreneaux.forEach((String creneau) async {
    await db.collection('creneaux_cv').add({"dispo" : true, "horaire" : creneau, "nom" : "", "prenom" : ""});
  });
}*/

/*
final List<Map<String, String>> toAdd = listStands.map((String stand) {
  return {
    'stand': stand,
    'nom': 'Eiffage',
    'description':
        'Eiffage est un groupe de construction et de concessions français, fondé en 1993 par la fusion de Fougerolle et de SAE. Le groupe exerce aujourd\'hui dans de nombreux domaines des travaux publics : construction, infrastructures, concessions et énergie.',
    'facebook_url':
        'fb://facewebmodal/f?href=https://www.facebook.com/EiffageConstruction/',
    'old_facebook_url': 'fb://page/EiffageConstruction',
    'linkedin_url': 'https://www.linkedin.com/company/eiffage_2/',
    'twitter_url': 'http://www.twitter.com/eiffage',
    'web_url': 'https://www.eiffage.com',
  };
}).toList();
*/

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

void getCreneaux() async {
  List<DocumentSnapshot> data = await getSnapshot('creneaux_cv');

  data.forEach((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.data.isNotEmpty) {
      Map<String, Object> newMap = {
        'dispo': documentSnapshot.data['dispo'],
        'horaire' : documentSnapshot.data['horaire'],
        'nom': documentSnapshot.data['nom'],
        'prenom' : documentSnapshot.data['prenom'],
      };
      if (!firmsId.contains(documentSnapshot.documentID)) {
        listCreneaux.add(newMap);
        listCreneauxId.add(documentSnapshot.documentID);
      }
    }
  });
}

void updateCreneau(Map<String,Object> map) async {
  List<DocumentSnapshot> data = await getSnapshot('creneaux_cv');

  final DocumentSnapshot creneauToUpdate = data.firstWhere((DocumentSnapshot documentSnapshot) {
    return documentSnapshot.data['horaire'] == map['horaire'];
  });

  await Firestore.instance.collection('creneaux_cv').document(creneauToUpdate.documentID).updateData(map);

  Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: darkBlueColor,
        textColor: white,
        fontSize: 16.0
    );
}

List<String> getAvailableCreneaux() {
  getCreneaux();

  List<String> res = [];

  listCreneaux.forEach((Map<String,Object> map) {
    if (map['dispo']) {
      res.add(map['horaire']);
    }
  });

  res.sort();

  return res;
}


