import 'package:interview_getx/domain/entities/user/login_info.dart';
import 'package:interview_getx/domain/entities/user/register_info.dart';
import 'package:interview_getx/domain/params/login_request.dart';
import 'package:interview_getx/domain/params/register_request.dart';

abstract class AuthRepository {
  /// Auth login
  Future<LoginInfo> login({required LoginRequest request});

  /// Auth Register
  Future<RegisterInfo> register({required RegisterRequest request});
}
