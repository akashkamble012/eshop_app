import 'package:flutter/material.dart';

import 'dialog_container.dart';

class NoInternetConnection extends StatelessWidget {
  final void Function()? okButton;
  const NoInternetConnection({Key? key, this.okButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      title: 'No Internet Connection',
      subTitle: 'Please Check your Internet Connection',
      network: true,
      
      okButton: okButton ??
          () {
             Navigator.of(context).pop();
          },
    );
  }
}
