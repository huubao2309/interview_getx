import 'package:interview_getx/domain/entities/base/base_entity.dart';

class UserModel extends BaseEntity {
  UserModel({
    required this.id,
    required this.name,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(hasError: hasError, messageError: messageError, statusCode: statusCode);

  final String? id;
  final String? name;
}
