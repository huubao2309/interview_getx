import 'dart:convert';

import 'package:interview_getx/api/common/define_field.dart';

class RegisterRequest {
  RegisterRequest({
    required this.username,
    required this.password,
  });

  factory RegisterRequest.fromRawJson(String str) => RegisterRequest.fromJson(json.decode(str));

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
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
