import 'dart:convert';

import '../../data/common/define_field.dart';

class RegisterResponse {
  RegisterResponse({
    required this.id,
  });

  factory RegisterResponse.fromRawJson(String str) => RegisterResponse.fromJson(json.decode(str));

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        id: json[ID_FIELD],
      );

  String? id;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        ID_FIELD: id,
      };
}
