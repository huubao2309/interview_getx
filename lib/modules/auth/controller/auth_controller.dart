import 'package:flutter/material.dart';
import 'package:interview_getx/api/repository/api_repository.dart';
import 'package:interview_getx/models/request/login_request.dart';
import 'package:interview_getx/models/request/register_request.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/constants/storage.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/utils/common_widget.dart';
import 'package:interview_getx/shared/utils/focus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthController({required this.apiRepository});

  final ApiRepository apiRepository;

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerUserNameController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginUserNameController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> register(BuildContext context) async {
    AppFocus.unFocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        await CommonWidget.toast('Please check the terms first.');
        return;
      }

      final res = await apiRepository.register(
        RegisterRequest(
          username: registerUserNameController.text,
          password: registerPasswordController.text,
        ),
      );

      if (res!.id!.isNotEmpty) {
        // Set Text for Login
        loginUserNameController.text = res.id!;
        loginPasswordController.text = registerPasswordController.text;

        // Clear Text of Register
        registerUserNameController.text = '';
        registerPasswordController.text = '';
        registerConfirmPasswordController.text = '';

        await Get.offAndToNamed(Routes.AUTH + Routes.LOGIN, arguments: this);
      }
    }
  }

  Future<void> login(BuildContext context) async {
    AppFocus.unFocus(context);
    if (loginFormKey.currentState!.validate()) {
      final res = await apiRepository.login(
        LoginRequest(
          username: loginUserNameController.text,
          password: loginPasswordController.text,
        ),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        await prefs.setString(StorageConstants.token, res.token);
        await prefs.setString(StorageConstants.userId, loginUserNameController.text);
        await Get.offAndToNamed(Routes.HOME);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();

    registerUserNameController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    loginUserNameController.dispose();
    loginPasswordController.dispose();
  }
}
