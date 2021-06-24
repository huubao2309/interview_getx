import 'package:flutter/material.dart';
import 'package:interview_getx/modules/auth/auth.dart';
import 'package:interview_getx/shared/shared.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CommonWidget.appBar(
            context,
            'register'.tr.toUpperCase(),
            backIcon: Icons.arrow_back,
            color: Colors.white,
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: _buildForms(context),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: controller.registerUserNameController,
              keyboardType: TextInputType.text,
              labelText: 'email_address'.tr,
              placeholder: 'enter_email_address'.tr,
              validator: (value) {
                if (!Regex.isEmail(value!)) {
                  return 'email_format_error'.tr;
                }

                if (value.isEmpty) {
                  return 'email_required'.tr;
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: controller.registerPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'password'.tr,
              placeholder: 'enter_password'.tr,
              password: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'password_required'.tr;
                }

                if (value.length < 6 || value.length > 15) {
                  return 'password_required_length'.tr;
                }

                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: controller.registerConfirmPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'confirm_password'.tr,
              placeholder: 'enter_password'.tr,
              password: true,
              validator: (value) {
                if (controller.registerPasswordController.text != controller.registerConfirmPasswordController.text) {
                  return 'confirm_password_consistence'.tr;
                }

                if (value!.isEmpty) {
                  return 'confirm_password_required'.tr;
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(height: 10),
            AppCheckbox(
              label: 'conditions_policy'.tr,
              checked: controller.registerTermsChecked,
              onChecked: (val) {
                controller.registerTermsChecked = val!;
              },
            ),
            CommonWidget.rowHeight(height: 80),
            BorderButton(
              text: 'register'.tr.toUpperCase(),
              textColor: Colors.green,
              backgroundColor: Colors.white,
              onPressed: () {
                controller.register(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
