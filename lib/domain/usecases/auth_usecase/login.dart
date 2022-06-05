import 'package:interview_getx/data/repository/auth_repository/auth_repository.dart';
import 'package:interview_getx/domain/entities/user/login_info.dart';
import 'package:interview_getx/domain/params/login_request.dart';
import 'package:interview_getx/domain/usecases/useCase.dart';

class Login implements UseCase<LoginInfo, LoginRequest> {
  Login(this.repository);

  final AuthRepository repository;

  @override
  Future<LoginInfo> callAsync(LoginRequest request) async {
    return await repository.login(request: request);
  }

  @override
  LoginInfo call(LoginRequest params) {
    throw UnimplementedError('Cannot use Login use case');
  }
}
