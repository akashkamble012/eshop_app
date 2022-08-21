import '../../Helper/custom_alert_dialog.dart';
import '../../Helper/styles.dart';
import '../circular_loader.dart';
import 'product_delete_dialog.dart';
import 'package:flutter/material.dart';

import 'accept_alert_dialog.dart';
import 'logout_dialog.dart';
import 'no_internet_connection.dart';

class AlertDialogBoxs {
  static BuildContext? _context;
  static Future<void> logoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      useSafeArea: true,
      builder: (_) {
        return const LogoutDialog();
      },
    );
  }

  static Future<void> noInternetConnectionDialog(BuildContext context, {void Function()? okButton}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return NoInternetConnection(
          okButton: okButton,
        );
      },
    );
  }

  static Future<void> rejectDialog(BuildContext context, {required void Function() okButton}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return AcceptOrRejectAlertDialog(name: "Do you want to reject this appointment", okButton: okButton);
      },
    );
  }

  static Future<void> acceptDialog(BuildContext context, {required void Function() okButton}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return AcceptOrRejectAlertDialog(name: "Do you want to accept this appointment", okButton: okButton);
      },
    );
  }

  static Future<bool> exitApp(BuildContext context, {required Function() okButton}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return AcceptOrRejectAlertDialog(name: "Do you want to exit App", okButton: okButton);
      },
    );
  }

  static Future<bool> deleteProduct(BuildContext context, {required Function() okButton}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return ProductDeleteDialog(okButton: okButton);
      },
    );
  }

  static Future<void> showLoader(BuildContext context) {
    _context = context;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Row(
            children: const [
              Styles.sizedBoxW20,
              CircularLoader(),
              Styles.sizedBoxW20,
              Text('Placing Your Order......'),
            ],
          ),
        ),
      ),
    );
  }

  static popLoader() {
    Navigator.of(_context!).pop();
  }
}
