import 'package:flutter/material.dart';

import '../../../features/auth/domain/usecases/logout.dart';
import '../../../injection_container.dart';
import 'dialog_container.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      title: 'Are you sure?',
      subTitle: "You will be logged out",
      cancelButton: () {
        Navigator.of(context).pop();
      },
      okButton: () async {
        Navigator.of(context).pop();
        getIt<Logout>().call();
      },
    );
  }
}
