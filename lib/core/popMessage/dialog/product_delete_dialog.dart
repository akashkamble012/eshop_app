import 'package:flutter/material.dart';

import 'dialog_container.dart';

class ProductDeleteDialog extends StatelessWidget {
  final Function() okButton;
  const ProductDeleteDialog({Key? key, required this.okButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      title: 'Alert',
      subTitle: 'Are you sure you want to delete this item',
      okButton: okButton,
      cancelButton: () {
        Navigator.of(context).pop(false);
      },
    );
  }
}
