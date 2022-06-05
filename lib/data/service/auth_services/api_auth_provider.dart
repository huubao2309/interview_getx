import 'dart:convert';

import 'package:get/get.dart';
import 'package:interview_getx/data/base/base_auth_provider.dart';
import 'package:interview_getx/domain/params/login_request.dart';
import 'package:interview_getx/domain/params/register_request.dart';
import 'package:interview_getx/shared/utils/logger/my_app_logger.dart';

class ApiAuthProvider extends BaseAuthProvider {
  MyAppLogger get loggerAuth => const MyAppLogger('AuthService');

  Future<Response> login({required String path, required LoginRequest request}) async {
    loggerAuth.log(content: 'Request login $path: ${request.toRawJson()}');
    final result = await post(path, request.toJson());
    loggerAuth.log(content: 'Response login: ${jsonEncode(result.body)}');
    return result;
  }

  Future<Response> register({required String path, required RegisterRequest request}) async {
    loggerAuth.log(content: 'Request register $path: ${request.toRawJson()}');
    final result = await post(path, request.toJson());
    loggerAuth.log(content: 'Response register: ${jsonEncode(result.body)}');
    return result;
  }
}
