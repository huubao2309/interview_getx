import 'package:interview_getx/data/graphql/query/demo_query_graphql.graphql.dart';
import 'package:interview_getx/domain/entities/todos/todo_model.dart';
import 'package:interview_getx/domain/entities/user/user_model.dart';

Error createError(String errorStr) {
  final Error error = ArgumentError(errorStr);
  return error;
}

List<TodoItem> convertListTodoModel(List<GetActiveTodos$QueryRoot$Todos> list) {
  final listTodo = <TodoItem>[];
  for (final item in list) {
    listTodo.add(convertTodoModel(item));
  }
  return listTodo;
}

TodoItem convertTodoModel(GetActiveTodos$QueryRoot$Todos todo) {
  return TodoItem(
    createdAt: todo.createdAt,
    id: todo.id,
    title: todo.title,
    isCompleted: todo.isCompleted,
    user: convertUserModel(todo.user),
  );
}

UserModel convertUserModel(GetActiveTodos$QueryRoot$Todos$Users user) {
  return UserModel(
    id: user.id,
    name: user.name,
  );
}
