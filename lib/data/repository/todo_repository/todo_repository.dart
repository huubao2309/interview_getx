import 'package:interview_getx/domain/entities/todos/list_todo_model.dart';
import 'package:interview_getx/domain/params/get_list_todo_request.dart';

// ignore: one_member_abstracts
abstract class TodoRepository {
  /// Get List To do
  Future<Todos> getListTodo({required GetListTodoRequest request});
}
