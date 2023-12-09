


import 'package:connectivity_plus/connectivity_plus.dart';

class Utils{

  static Future<bool> checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.mobile &&
        result != ConnectivityResult.wifi) {
      return Future<bool>.value(false);
    } else {
      return Future<bool>.value(true);
    }
  }
}