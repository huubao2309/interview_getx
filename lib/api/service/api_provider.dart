import 'package:interview_getx/api/base/base_provider.dart';
import 'package:get/get.dart';
import 'package:interview_getx/models/request/login_request.dart';
import 'package:interview_getx/models/request/register_request.dart';

class ApiProvider extends BaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> getUsers(String path) {
    return get(path);
  }
}
