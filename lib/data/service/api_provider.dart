import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import '../../data/base/base_graphql_provider.dart';
import '../../data/base/base_provider.dart';
import '../../data/common/common_method.dart';
import '../../data/common/define_field.dart';
import '../../data/graphql/query/demo_query_graphql.dart';
import '../../models/request/login_request.dart';
import '../../models/request/register_request.dart';

class ApiProvider extends BaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<graphql.QueryResult> getListTodo({required int limit, required int offset}) {
    print('Request Demo GraphQl with API: URI: ');
    return BaseGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
          document: GetActiveTodosQuery(
            variables: GetActiveTodosArguments(),
          ).document,
          variables: {
            LIMIT_FIELD: limit,
            OFFSET_FIELD: offset,
          }),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }
}
