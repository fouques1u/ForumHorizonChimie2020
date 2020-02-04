import 'package:flutter/material.dart';

import '../colors.dart';
import 'firm_modal_bottom_sheet.dart';

class ListTileFirmWidget extends StatelessWidget {
  const ListTileFirmWidget({Key key, @required this.standInformations})
      : super(key: key);

  final Map<String, String> standInformations;

  void showFirmInformations(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: lightGreenColor,
      context: context,
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      builder: (context) => FirmModalBottomSheet(
        standInformations: standInformations,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        standInformations['nom'],
        style: Theme.of(context).textTheme.body1,
      ),
      subtitle: Text("Stand : ${standInformations['stand']}", style: Theme.of(context).textTheme.body1.apply(fontSizeDelta: -3.0)),
      onTap: () => showFirmInformations(context),
      dense: true,
    );
  }
}
