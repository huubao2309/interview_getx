import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:interview_getx/domain/params/login_request.dart';
import 'package:interview_getx/domain/params/register_request.dart';
import 'package:interview_getx/domain/usecases/auth_usecase/login.dart';
import 'package:interview_getx/domain/usecases/auth_usecase/register.dart';
import 'package:interview_getx/domain/usecases/local_storage/get_shared_preferences.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:interview_getx/shared/helpers/validators.dart';
import 'package:interview_getx/shared/utils/common_widget.dart';
import 'package:interview_getx/shared/utils/focus.dart';
import 'package:interview_getx/shared/utils/logger/my_app_logger.dart';

class AuthController extends SuperController {
  AuthController({
    required this.login,
    required this.register,
  });

  final Login login;
  final Register register;

  MyAppLogger get logger => const MyAppLogger('AuthController');

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
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<void> registerHandler(BuildContext context) async {
    AppFocus.unFocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        await CommonWidget.instance.toast('Please check the terms first.');
        return;
      }

      await EasyLoading.show();
      final res = await register.callAsync(
        RegisterRequest(
          username: registerUserNameController.text,
          password: registerPasswordController.text,
        ),
      );

      if (res.hasError) {
        await EasyLoading.dismiss();
        final request = CommonDialogRequest(
          title: 'error'.tr,
          description: 'error_login'.tr,
          isMustTapButton: true,
        );
        await _doShowDialog(request);
        return;
      }

      await EasyLoading.dismiss();
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

  Future<void> loginHandler(BuildContext context) async {
    AppFocus.unFocus(context);
    if (loginFormKey.currentState!.validate()) {
      await EasyLoading.show();
      final result = await login.callAsync(
        LoginRequest(
          username: loginUserNameController.text.trim(),
          password: loginPasswordController.text.trim(),
        ),
      );

      if (result.hasError) {
        await EasyLoading.dismiss();
        final request = CommonDialogRequest(
          title: 'error'.tr,
          description: 'error_login'.tr,
          isMustTapButton: true,
        );
        await _doShowDialog(request);
        return;
      }

      await EasyLoading.dismiss();
      final storage = Get.find<GetSharedPreferences>();
      if (result.token != null && result.token!.isNotEmpty) {
        await storage.value.setLocalToken(token: result.token!);
        await storage.value.setLocalId(id: loginUserNameController.text);
        await Get.offAndToNamed(Routes.HOME);
      }
    }
  }

  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      logger.log(content: 'User press confirm');
    } else {
      logger.log(content: 'User press cancel!');
    }
  }

  String? validateEmailHandler(String? value) {
    final validators = Validators();
    final result = validators.validateEmail(value);
    return result;
  }

  String? validatePasswordHandler(String? value) {
    final validators = Validators();
    final result = validators.validatePassword(value);
    return result;
  }

  @override
  void onDetached() {
    logger.log(content: 'onDetached');
  }

  @override
  void onInactive() {
    logger.log(content: 'onInactive');
  }

  @override
  void onPaused() {
    logger.log(content: 'onPaused');
  }

  @override
  void onResumed() {
    logger.log(content: 'onResumed');
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
