import 'package:interview_getx/models/todos_model/todo_model.dart';
import 'package:interview_getx/models/user_model/user_model.dart';
import '../../data/graphql/query/demo_query_graphql.dart';

Error createError(String errorStr) {
  final Error error = ArgumentError(errorStr);
  return error;
}

List<TodoModel> convertListTodoModel(List<GetActiveTodos$QueryRoot$Todos> list) {
  final listTodo = <TodoModel>[];
  for (final item in list) {
    listTodo.add(convertTodoModel(item));
  }
  return listTodo;
}

TodoModel convertTodoModel(GetActiveTodos$QueryRoot$Todos todo) {
  return TodoModel(
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
