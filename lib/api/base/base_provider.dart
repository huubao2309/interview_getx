import 'package:get/get.dart';
import 'package:interview_getx/api/common/api_constants.dart';
import 'package:interview_getx/api/interceptors/auth_interceptor.dart';
import 'package:interview_getx/api/interceptors/request_interceptor.dart';
import 'package:interview_getx/api/interceptors/response_interceptor.dart';

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
