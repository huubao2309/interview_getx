import 'package:interview_getx/domain/entities/base/base_entity.dart';
import 'package:interview_getx/domain/entities/todos/todo_model.dart';

class Todos extends BaseEntity {
  Todos({
    required this.items,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(hasError: hasError, messageError: messageError, statusCode: statusCode);

  Todos.converter({
    this.items,
    bool hasError = false,
    String messageError = '',
    int? statusCode,
  }) : super(hasError: hasError, messageError: messageError, statusCode: statusCode);

  final List<TodoItem>? items;
}
