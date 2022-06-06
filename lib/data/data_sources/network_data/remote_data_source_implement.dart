import 'package:get/get.dart';
import 'package:interview_getx/data/common/define_api.dart';
import 'package:interview_getx/data/data_sources/network_data/remote_data_source.dart';
import 'package:interview_getx/data/exception/exceptions.dart';
import 'package:interview_getx/data/graphql/query/demo_query_graphql.graphql.dart';
import 'package:interview_getx/data/interceptors/graphql_interceptor.dart';
import 'package:interview_getx/data/models/user/login_response.dart';
import 'package:interview_getx/data/models/user/register_response.dart';
import 'package:interview_getx/data/service/auth_services/api_auth_provider.dart';
import 'package:interview_getx/data/service/operator_services/api_services_provider.dart';
import 'package:interview_getx/domain/params/get_list_todo_request.dart';
import 'package:interview_getx/domain/params/login_request.dart';
import 'package:interview_getx/domain/params/register_request.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.apiAuthProvider,
    required this.apiServicesProvider,
  });

  final ApiAuthProvider apiAuthProvider;
  final ApiServicesProvider apiServicesProvider;

  @override
  Future<LoginResponse> login({required LoginRequest request}) async {
    final result = await apiAuthProvider.login(path: LOGIN_URN, request: request);
    if (result.status.isOk) {
      final response = LoginResponse.fromJson(result.body);
      return response;
    }

    // Has error + message to Server
    final messageError = 'error_no_define'.tr;
    throw ServerException(statusCode: result.statusCode, errorMessage: messageError);
  }

  @override
  Future<RegisterResponse> register({required RegisterRequest request}) async {
    final result = await apiAuthProvider.register(path: REGISTER_URN, request: request);
    if (result.status.isOk) {
      final response = RegisterResponse.fromJson(result.body);
      return response;
    }

    // Has error + message to Server
    final messageError = 'error_no_define'.tr;
    throw ServerException(statusCode: result.statusCode, errorMessage: messageError);
  }

  @override
  Future<GetActiveTodos$QueryRoot> getListTodo({required GetListTodoRequest request}) async {
    final results = await apiServicesProvider.getListTodo(limit: request.limit, offset: request.offset);
    if (!results.hasException) {
      final result = GetActiveTodos$QueryRoot.fromJson(results.data!);
      return result;
    }

    // Has error + message to Server
    final error = await handleErrorGraphQL(results.exception!);
    if (error is int) {
      throw ServerException(statusCode: 401, errorMessage: 'Token is expired');
    }

    final messageError = 'error_no_define'.tr;
    throw ServerException(errorMessage: messageError);
  }
}
