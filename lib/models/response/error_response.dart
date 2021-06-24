import 'dart:convert';

import 'package:interview_getx/api/api.dart';

class ErrorResponse {
  ErrorResponse({
    required this.error,
    required this.message,
    required this.type,
  });

  factory ErrorResponse.fromRawJson(String str) => ErrorResponse.fromJson(json.decode(str));

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        error: json[ERROR_FIELD],
        message: json[MESSAGE_FIELD],
        type: json[TYPE_FIELD],
      );

  final String? error;
  final String? message;
  final String? type;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        ERROR_FIELD: error,
        MESSAGE_FIELD: message,
        TYPE_FIELD: type,
      };
}
