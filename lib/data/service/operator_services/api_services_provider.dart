import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:interview_getx/data/base/base_graphql_provider.dart';
import 'package:interview_getx/data/common/common_method.dart';
import 'package:interview_getx/data/common/define_field.dart';
import 'package:interview_getx/data/graphql/query/demo_query_graphql.graphql.dart';

class ApiServicesProvider {
  /// Get List To do
  Future<graphql.QueryResult> getListTodo({
    required int limit,
    required int offset,
  }) {
    final optionQuery = graphql.QueryOptions(
      document: GetActiveTodosQuery(
        variables: GetActiveTodosArguments(),
      ).document,
      variables: {
        LIMIT_FIELD: limit,
        OFFSET_FIELD: offset,
      },
    );
    return BaseGraphQLProvider.instance.value.query(optionQuery).timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)),
        onTimeout: () {
      throw createError('Timeout Error');
    });
  }
}
