import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:interview_getx/data/base/base_controller.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:interview_getx/shared/utils/common_widget.dart';
import 'package:interview_getx/shared/utils/focus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repository/api_repository.dart';
import '../../../models/request/login_request.dart';
import '../../../models/request/register_request.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/storage.dart';

class AuthController extends BaseController {
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
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
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

      if (res == null) {
        await EasyLoading.dismiss();
        await callDialogErrorNetwork();
        return;
      }

      if (res.id!.isNotEmpty) {
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

      if (res == null) {
        await EasyLoading.dismiss();
        await callDialogErrorNetwork();
        return;
      }

      final prefs = Get.find<SharedPreferences>();
      if (res.token.isNotEmpty) {
        await prefs.setString(StorageConstants.token, res.token);
        await prefs.setString(StorageConstants.userId, loginUserNameController.text);
        await Get.offAndToNamed(Routes.HOME);
      }
    }
  }

  // ignore: unused_element
  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      await _handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  Future<void> _handleEventDialog(String? defineEvent) async {
    switch (defineEvent) {
      default:
        break;
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
