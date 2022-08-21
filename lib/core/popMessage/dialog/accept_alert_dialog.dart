import 'package:flutter/material.dart';

import 'dialog_container.dart';

class AcceptOrRejectAlertDialog extends StatelessWidget {
  final Function() okButton;
  final String name;
  const AcceptOrRejectAlertDialog(
      {Key? key, required this.name, required this.okButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      title: 'Alert',
      subTitle: name,
      cancelButton: () {
        Navigator.of(context).pop(false);
      },
      okButton: okButton,
    );
  }
}
