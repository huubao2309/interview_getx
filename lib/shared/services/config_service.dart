import 'package:get/get.dart';
import 'package:interview_getx/config/config_environment.dart';

class ConfigService {
  Future<EnvConfiguration> init(String environment) async {
    Get.lazyPut<EnvConfiguration>(() => EnvConfiguration(environment: environment));
    return EnvConfiguration(environment: environment);
  }
}
