import 'package:flutter_test/flutter_test.dart';
import 'package:interview_getx/shared/helpers/validators.dart';

void main() {
  late Validators validators;

  setUpAll(() {
    validators = Validators();
  });

  group(
    'Validators',
    () {
      group(
        'Email',
        () {
          test(
            'should return error string if empty',
            () {
              final result = validators.validateEmail('');
              expect(result, 'email_required');
            },
          );

          test(
            'should return null if not empty',
            () {
              final result = validators.validateEmail('email@gmail.com');
              expect(result, null);
            },
          );

          test(
            'should return error if not right format',
            () {
              final result = validators.validateEmail('!!!!@gmail.com');
              expect(result, 'email_format_error');
            },
          );
        },
      );

      group(
        'Password',
        () {
          test(
            'should return error string if empty',
            () {
              final result = validators.validatePassword('');
              expect(result, 'password_required');
            },
          );

          test(
            'should return null if not empty',
            () {
              final result = validators.validatePassword('password');
              expect(result, null);
            },
          );

          test(
            'should return error password length < 6',
            () {
              final result = validators.validatePassword('12345');
              expect(result, 'password_required_length');
            },
          );

          test(
            'should return error password length > 15',
            () {
              final result = validators.validatePassword('1234567890123456'); // 16 chars
              expect(result, 'password_required_length');
            },
          );

          test(
            'should return null if password >= 6 and <= 15',
            () {
              final result = validators.validatePassword('123456');
              expect(result, null);
            },
          );
        },
      );
    },
  );
}
