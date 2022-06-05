import 'package:interview_getx/data/common/define_field.dart';
import 'package:interview_getx/domain/entities/user/login_info.dart';

class LoginResponse extends LoginInfo {
  LoginResponse({
    String? token,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(
          token: token,
          hasError: hasError,
          messageError: messageError,
          statusCode: statusCode,
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json[TOKEN_FIELD],
      );

  Map<String, dynamic> toJson() => {
        TOKEN_FIELD: token,
      };
}
