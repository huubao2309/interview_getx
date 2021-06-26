import 'dart:convert';

import 'package:interview_getx/api/common/define_field.dart';

class LoginResponse {
  LoginResponse({
    required this.token,
  });

  factory LoginResponse.fromRawJson(String str) => LoginResponse.fromJson(json.decode(str));

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json[TOKEN_FIELD],
      );

  String token;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        TOKEN_FIELD: token,
      };
}
