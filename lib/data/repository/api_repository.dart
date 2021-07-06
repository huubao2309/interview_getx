import 'dart:async';
import 'package:interview_getx/data/interceptors/graphql_interceptor.dart';
import '../../data/common/define_api.dart';
import '../../data/graphql/query/demo_query_graphql.dart';
import '../../data/service/api_provider.dart';
import '../../models/request/login_request.dart';
import '../../models/request/register_request.dart';
import '../../models/response/login_response.dart';
import '../../models/response/register_response.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login(LOGIN_URN, data);
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register(REGISTER_URN, data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<List<GetActiveTodos$QueryRoot$Todos>> getList({required int limit, required int offset}) async {
    final c = Completer<List<GetActiveTodos$QueryRoot$Todos>>();
    try {
      final results = await apiProvider.getListTodo(limit: limit, offset: offset);
      if (!results.hasException) {
        final listTodo = GetActiveTodos$QueryRoot.fromJson(results.data!).todos;
        c.complete(listTodo);
      } else {
        print('Exception: ${results.exception}');
        c.completeError(handleErrorGraphQL(results.exception!));
      }
    } catch (ex, stackTrace) {
      print(stackTrace.toString());
      c.completeError(ex.toString());
    }

    return c.future;
  }
}
