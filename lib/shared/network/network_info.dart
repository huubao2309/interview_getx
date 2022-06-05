import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:interview_getx/shared/utils/logger/my_app_logger.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.connectivity);

  final Connectivity connectivity;

  MyAppLogger get logger => const MyAppLogger('NetworkService');

  @override
  Future<bool> get isConnected => hasConnectNetwork();

  Future<bool> hasConnectNetwork() async {
    try {
      final result = await connectivity.checkConnectivity();
      if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
        return true;
      }

      return false;
    } on PlatformException catch (e, stackTrace) {
      logger.log(content: e.toString(), stackTrace: stackTrace);
      return false;
    }
  }
}
