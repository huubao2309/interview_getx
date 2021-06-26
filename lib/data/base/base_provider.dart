import 'package:get/get.dart';
import '../../config/config_environment.dart';
import '../../data/interceptors/auth_interceptor.dart';
import '../../data/interceptors/request_interceptor.dart';
import '../../data/interceptors/response_interceptor.dart';
import '../../shared/constants/common.dart';

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
