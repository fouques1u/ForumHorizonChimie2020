import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirmModalBottomSheet extends StatelessWidget {
  final String standNumber;
  final String _firmTitle = 'EIFFAGE';
  final String _firmDescription =
      'Eiffage est un groupe de construction et de concessions français, fondé en 1993 par la fusion de Fougerolle et de SAE. Le groupe exerce aujourd\'hui dans de nombreux domaines des travaux publics : construction, infrastructures, concessions et énergie.';
  final String _oldFacebookUrl =
      'fb://page/EiffageConstruction'; // Handle versions in Facebook
  final String _facebookUrl =
      'fb://facewebmodal/f?href=https://www.facebook.com/EiffageConstruction/';
  final String _linkedInUrl =
      'https://www.linkedin.com/company/eiffage_2/';
  final String _twitterUrl = 'http://www.twitter.com/eiffage';
  final String _webSiteUrl = 'https://www.eiffage.com';

  FirmModalBottomSheet({@required this.standNumber});

  Future _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future _launchFacebookUrl(String oldUrl, String newUrl) async {
    //TODO: Manage the old way of going into a facebook app with id
    if (await canLaunch(newUrl)) {
      await launch(newUrl);
    } else {
      throw 'Could not launch $newUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Text(
            _firmTitle,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _firmDescription,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadiusDirectional.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                      child: Icon(
                        FontAwesomeIcons.facebook,
                        color: Color.fromRGBO(60, 90, 153, 1),
                      ),
                      onTap: () =>
                          _launchFacebookUrl(_oldFacebookUrl, _facebookUrl),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Icon(
                        FontAwesomeIcons.linkedin,
                        color: Color.fromRGBO(0, 119, 181, 1),
                      ),
                      onTap:  () => _launchURL(_linkedInUrl),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.lightBlue,
                      ),
                      onTap: () => _launchURL(_twitterUrl),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Icon(
                        Icons.language,
                        color: Colors.lightBlue,
                      ),
                      onTap: () => _launchURL(_webSiteUrl),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
