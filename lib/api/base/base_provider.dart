import 'package:get/get.dart';

import '../api.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient
      ..baseUrl = ApiConstants.baseUrl
      ..addAuthenticator(authInterceptor)
      ..addRequestModifier(requestInterceptor)
      ..addResponseModifier(responseInterceptor);
  }
}
