import 'package:interview_getx/domain/entities/base/base_entity.dart';
import 'package:interview_getx/domain/entities/user/user_model.dart';

class TodoItem extends BaseEntity {
  TodoItem({
    this.isCompleted,
    this.title,
    this.id,
    this.createdAt,
    this.user,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(hasError: hasError, messageError: messageError, statusCode: statusCode);

  final bool? isCompleted;
  final String? title;
  final int? id;
  final DateTime? createdAt;
  final UserModel? user;
}
