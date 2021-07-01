import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/utils/common_widget.dart';
import 'package:interview_getx/shared/utils/regex.dart';
import 'package:interview_getx/shared/widgets/background/gradient_background.dart';
import 'package:interview_getx/shared/widgets/button/border_button.dart';
import 'package:interview_getx/shared/widgets/text_input/input_field.dart';

import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
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
            'login'.tr.toUpperCase(),
            backIcon: Icons.arrow_back,
            color: Colors.white,
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: _buildForms(context),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: controller.loginUserNameController,
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
              controller: controller.loginPasswordController,
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
            CommonWidget.rowHeight(height: 35),
            BorderButton(
              text: 'login'.tr.toUpperCase(),
              textColor: Colors.green,
              backgroundColor: Colors.white,
              onPressed: () {
                controller.login(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
