import 'package:get/get.dart';
import 'package:interview_getx/data/data_sources/local_data/local_data_source.dart';
import 'package:interview_getx/data/data_sources/network_data/remote_data_source.dart';
import 'package:interview_getx/data/exception/exceptions.dart';
import 'package:interview_getx/data/repository/auth_repository/auth_repository.dart';
import 'package:interview_getx/domain/entities/user/login_info.dart';
import 'package:interview_getx/domain/entities/user/register_info.dart';
import 'package:interview_getx/domain/params/login_request.dart';
import 'package:interview_getx/domain/params/register_request.dart';
import 'package:interview_getx/shared/network/network_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  /// Auth login
  @override
  Future<LoginInfo> login({required LoginRequest request}) async {
    final hasNetwork = await networkInfo.isConnected;
    if (!hasNetwork) {
      return LoginInfo.converter(hasError: true, messageError: 'network_error_message'.tr);
    }

    try {
      final result = await remoteDataSource.login(request: request);
      return result;
    } on ServerException catch (ex) {
      return LoginInfo.converter(hasError: true, messageError: ex.toString(), statusCode: ex.statusCode);
    } catch (ex) {
      return LoginInfo.converter(hasError: true, messageError: 'error_no_define'.tr);
    }
  }

  /// Auth Register
  @override
  Future<RegisterInfo> register({required RegisterRequest request}) async {
    final hasNetwork = await networkInfo.isConnected;
    if (!hasNetwork) {
      return RegisterInfo.converter(hasError: true, messageError: 'network_error_message'.tr);
    }

    try {
      final result = await remoteDataSource.register(request: request);
      return result;
    } on ServerException catch (ex) {
      return RegisterInfo.converter(hasError: true, messageError: ex.toString(), statusCode: ex.statusCode);
    } catch (ex) {
      return RegisterInfo.converter(hasError: true, messageError: 'error_no_define'.tr);
    }
  }
}
