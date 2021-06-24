import 'dart:async';

import 'package:interview_getx/api/common/define_api.dart';
import 'package:interview_getx/models/models.dart';

import '../api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login(LOGIN_URN, data);
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register(REGISTER_URN, data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  // Future<UsersResponse?> getUsers() async {
  //   final res = await apiProvider.getUsers('/api/users?page=1&per_page=12');
  //   if (res.statusCode == 200) {
  //     return UsersResponse.fromJson(res.body);
  //   }
  // }
}
