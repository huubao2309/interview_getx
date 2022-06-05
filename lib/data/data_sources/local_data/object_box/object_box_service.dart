class ObjectBox {
  ObjectBox._();

  static final ObjectBox _instance = ObjectBox._();

  static ObjectBox get instance => _instance;

  Future<ObjectBox> createStore() async {
    return _instance;
  }
}
