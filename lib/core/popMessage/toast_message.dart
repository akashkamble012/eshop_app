import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> toastMessage({required String message}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    fontSize: 18,
  );
}
