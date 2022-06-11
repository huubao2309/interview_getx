import 'package:get/get.dart';
import 'package:interview_getx/shared/utils/regex.dart';

class Validators {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email_required'.tr;
    }

    final regrex = Regex();
    if (!regrex.isEmail(value)) {
      return 'email_format_error'.tr;
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password_required'.tr;
    }

    if (value.length < 6 || value.length > 15) {
      return 'password_required_length'.tr;
    }

    return null;
  }
}
