import 'package:interview_getx/domain/entities/base/base_entity.dart';

class RegisterInfo extends BaseEntity {
  RegisterInfo({
    required this.id,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(hasError: hasError, messageError: messageError, statusCode: statusCode);

  RegisterInfo.converter({
    this.id,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(hasError: hasError, messageError: messageError, statusCode: statusCode);

  final String? id;
}
