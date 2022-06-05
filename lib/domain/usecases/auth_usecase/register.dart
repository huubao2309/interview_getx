import 'package:interview_getx/data/repository/auth_repository/auth_repository.dart';
import 'package:interview_getx/domain/entities/user/register_info.dart';
import 'package:interview_getx/domain/params/register_request.dart';
import 'package:interview_getx/domain/usecases/useCase.dart';

class Register implements UseCase<RegisterInfo, RegisterRequest> {
  Register(this.repository);

  final AuthRepository repository;

  @override
  Future<RegisterInfo> callAsync(RegisterRequest request) async {
    return await repository.register(request: request);
  }

  @override
  RegisterInfo call(RegisterRequest params) {
    throw UnimplementedError('Cannot use Register use case');
  }
}
