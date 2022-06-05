import 'package:interview_getx/data/graphql/query/demo_query_graphql.graphql.dart';
import 'package:interview_getx/data/models/user/login_response.dart';
import 'package:interview_getx/data/models/user/register_response.dart';
import 'package:interview_getx/domain/params/get_list_todo_request.dart';
import 'package:interview_getx/domain/params/login_request.dart';
import 'package:interview_getx/domain/params/register_request.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login({required LoginRequest request});

  Future<RegisterResponse> register({required RegisterRequest request});

  Future<GetActiveTodos$QueryRoot> getListTodo({required GetListTodoRequest request});
}
