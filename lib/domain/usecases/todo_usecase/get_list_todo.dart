import 'package:interview_getx/data/repository/todo_repository/todo_repository.dart';
import 'package:interview_getx/domain/entities/todos/list_todo_model.dart';
import 'package:interview_getx/domain/params/get_list_todo_request.dart';
import 'package:interview_getx/domain/usecases/useCase.dart';

class GetListTodo implements UseCase<Todos, GetListTodoRequest> {
  GetListTodo(this.repository);

  final TodoRepository repository;

  @override
  Future<Todos> callAsync(GetListTodoRequest request) async {
    return await repository.getListTodo(request: request);
  }

  @override
  Todos call(GetListTodoRequest params) {
    throw UnimplementedError('Cannot use GetListTodo use case');
  }
}
