class NetworkHandler {
  NetworkHandler._();

  static final NetworkHandler _instance = NetworkHandler._();

  static NetworkHandler get instance => _instance;

  NetworkHandler getInstance() {
    return _instance;
  }

  Future<void> reConnectNetwork() async {
    await Future.delayed(const Duration(milliseconds: 1));
    // TODO: Reconnect Network
  }

  Future<void> disConnectNetwork() async {
    await Future.delayed(const Duration(milliseconds: 1));
    // TODO: DisConnect Network
  }
}
