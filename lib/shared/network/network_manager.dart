import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();

  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  Future<bool> initialise() async {
    _connectivity.onConnectivityChanged.listen(_checkStatus);
    return _checkOnlineNetwork();
  }

  Future<void> _checkStatus(ConnectivityResult result) async {
    final isOnline = await _checkOnlineNetwork();
    if (!_controller.isClosed) {
      _controller.sink.add(isOnline);
    }
  }

  Future<bool> _checkOnlineNetwork() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result == ConnectivityResult.wifi || result == ConnectivityResult.mobile;
    } on SocketException catch (_) {
      return false;
    }
  }

  void disposeStream() => _controller.close();
}
