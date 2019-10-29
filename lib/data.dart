import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

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

Map<String,String> getStandInformations(String stand) {
  getFirms();

  return firmsData.firstWhere((Map<String,String> element) {
    return element['stand'] == stand;
  });
}
