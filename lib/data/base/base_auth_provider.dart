import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:interview_getx/config/config_environment.dart';
import 'package:interview_getx/data/interceptors/response_interceptor.dart';
import 'package:interview_getx/shared/constants/common.dart';

class BaseAuthProvider extends GetConnect {
  Request _modifiedToken(Request r) {
    // final getSharedPreferences = Get.find<GetSharedPreferences>();
    // final token = getSharedPreferences.value.getAccessToken();
    // _myAppLogger.log(content: '_modifiedToken with $token');
    // if (token.isNotEmpty) {
    //   r.headers['Authorization'] = 'Bearer $token';
    //   r.headers['X-Auth'] = '1';
    // }
    return r;
  }

  FutureOr<Request> _authInterceptor(request) async {
    return _modifiedToken(request);
  }

  FutureOr<Request> _requestInterceptor(request) async {
    return await _authInterceptor(request);
  }

  @override
  void onInit() {
    final config = Get.find<EnvConfiguration>();
    httpClient
      ..baseUrl = config.value[GraphQLAuthUrl]
      ..addAuthenticator(_authInterceptor)
      ..addRequestModifier(_requestInterceptor)
      ..addResponseModifier(responseInterceptor);
  }
}
