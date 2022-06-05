import 'dart:convert';

import 'package:interview_getx/data/common/define_field.dart';

class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
  });

  factory LoginRequest.fromRawJson(String str) => LoginRequest.fromJson(json.decode(str));

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        username: json[USERNAME_FIELD],
        password: json[PASSWORD_FIELD],
      );

  final String username;
  final String password;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        USERNAME_FIELD: username,
        PASSWORD_FIELD: password,
      };
}
