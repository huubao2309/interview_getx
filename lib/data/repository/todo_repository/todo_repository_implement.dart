import 'package:get/get.dart';
import 'package:interview_getx/data/common/common_method.dart';
import 'package:interview_getx/data/data_sources/local_data/local_data_source.dart';
import 'package:interview_getx/data/data_sources/network_data/remote_data_source.dart';
import 'package:interview_getx/data/exception/exceptions.dart';
import 'package:interview_getx/data/repository/todo_repository/todo_repository.dart';
import 'package:interview_getx/domain/entities/todos/list_todo_model.dart';
import 'package:interview_getx/domain/params/get_list_todo_request.dart';
import 'package:interview_getx/shared/network/network_info.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  /// Auth login
  @override
  Future<Todos> getListTodo({required GetListTodoRequest request}) async {
    final hasNetwork = await networkInfo.isConnected;
    if (!hasNetwork) {
      return Todos.converter(hasError: true, messageError: 'network_error_message'.tr);
    }

    try {
      final resultModel = await remoteDataSource.getListTodo(request: request);
      final result = convertListTodoModel(resultModel.todos);
      return Todos(items: result);
    } on ServerException catch (ex) {
      return Todos.converter(hasError: true, messageError: ex.toString(), statusCode: ex.statusCode);
    } catch (ex) {
      return Todos.converter(hasError: true, messageError: 'error_no_define'.tr);
    }
  }
}
