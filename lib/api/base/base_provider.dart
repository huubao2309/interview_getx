import 'package:get/get.dart';
import 'package:interview_getx/api/interceptors/auth_interceptor.dart';
import 'package:interview_getx/api/interceptors/request_interceptor.dart';
import 'package:interview_getx/api/interceptors/response_interceptor.dart';
import 'package:interview_getx/config/config_environment.dart';
import 'package:interview_getx/shared/constants/common.dart';

class BaseProvider extends GetConnect {
  final config = Get.find<EnvConfiguration>();
  @override
  void onInit() {
    httpClient
      ..baseUrl = config.value[GraphQLAuthUrl]
      ..addAuthenticator(authInterceptor)
      ..addRequestModifier(requestInterceptor)
      ..addResponseModifier(responseInterceptor);
  }
}
