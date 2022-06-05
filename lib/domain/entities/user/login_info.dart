import 'package:interview_getx/domain/entities/base/base_entity.dart';

class LoginInfo extends BaseEntity {
  LoginInfo({
    required this.token,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(hasError: hasError, messageError: messageError, statusCode: statusCode);

  LoginInfo.converter({
    this.token,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(hasError: hasError, messageError: messageError, statusCode: statusCode);

  final String? token;
}
