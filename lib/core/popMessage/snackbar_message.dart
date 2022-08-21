import 'package:flutter/material.dart';

snackBarMessage(BuildContext context, {required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 500),
    ),
  );
}
