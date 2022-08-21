import 'dart:async';
import 'dart:io';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkImpl extends NetworkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      final results = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));

      if (results.isNotEmpty && results[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    }
  }
}
