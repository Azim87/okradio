import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@injectable
class NetworkChecker {
  Future<bool> get isConnected async => checkConnectivity();

  Future<bool> checkConnectivity() async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      return true;
    } else {
      return false;
    }
  }
}
