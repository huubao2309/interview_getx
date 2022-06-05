import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:interview_getx/data/data_sources/network_data/remote_data_source.dart';
import 'package:interview_getx/data/data_sources/network_data/remote_data_source_implement.dart';
import 'package:interview_getx/data/repository/auth_repository/auth_repository.dart';
import 'package:interview_getx/data/repository/auth_repository/auth_repository_implement.dart';
import 'package:interview_getx/data/repository/todo_repository/todo_repository.dart';
import 'package:interview_getx/data/repository/todo_repository/todo_repository_implement.dart';
import 'package:interview_getx/data/service/auth_services/api_auth_provider.dart';
import 'package:interview_getx/data/service/operator_services/api_services_provider.dart';
import 'package:interview_getx/domain/usecases/auth_usecase/login.dart';
import 'package:interview_getx/domain/usecases/auth_usecase/register.dart';
import 'package:interview_getx/domain/usecases/todo_usecase/get_list_todo.dart';
import 'package:interview_getx/shared/network/network_info.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get
      ..put<NetworkInfo>(NetworkInfoImpl(Connectivity()))
      ..put(ApiAuthProvider(), permanent: true)
      ..put(ApiServicesProvider(), permanent: true)
      ..put<RemoteDataSource>(
        RemoteDataSourceImpl(
          apiAuthProvider: Get.find(),
          apiServicesProvider: Get.find(),
        ),
        permanent: true,
      );

    /// Repository
    Get
      ..put<AuthRepository>(AuthRepositoryImpl(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
        networkInfo: Get.find(),
      ))
      ..put<TodoRepository>(TodoRepositoryImpl(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
        networkInfo: Get.find(),
      ));

    /// UseCase
    // Auth UseCase
    Get
      ..put(Login(Get.find()))
      ..put(Register(Get.find()));

    // To do Use case
    Get.put(GetListTodo(Get.find()));
  }
}
