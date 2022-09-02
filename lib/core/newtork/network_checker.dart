import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkChecker {
  Future<bool> get isConnected async => checkConnectivity();

  Future<bool> checkConnectivity() async {
    ConnectivityResult connectivityResult =
        await (new Connectivity().checkConnectivity());

    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
}
