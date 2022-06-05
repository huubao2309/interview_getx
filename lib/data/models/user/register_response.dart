import 'package:interview_getx/data/common/define_field.dart';
import 'package:interview_getx/domain/entities/user/register_info.dart';

class RegisterResponse extends RegisterInfo {
  RegisterResponse({
    String? id,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(
          id: id,
          hasError: hasError,
          messageError: messageError,
          statusCode: statusCode,
        );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        id: json[ID_FIELD],
      );

  Map<String, dynamic> toJson() => {
        ID_FIELD: id,
      };
}
