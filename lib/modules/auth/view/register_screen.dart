import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/modules/auth/controller/auth_controller.dart';
import 'package:interview_getx/shared/utils/common_widget.dart';
import 'package:interview_getx/shared/widgets/background/gradient_background.dart';
import 'package:interview_getx/shared/widgets/button/border_button.dart';
import 'package:interview_getx/shared/widgets/check_box/app_check_box.dart';
import 'package:interview_getx/shared/widgets/text_input/input_field.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CommonWidget.instance.appBar(
            context,
            'register'.tr.toUpperCase(),
            backIcon: Icons.arrow_back,
            color: Colors.white,
          ),
          body: Scrollbar(
            controller: _scrollController,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: _buildForms(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: controller.registerUserNameController,
              keyboardType: TextInputType.text,
              labelText: 'email_address'.tr,
              placeholder: 'enter_email_address'.tr,
              validator: controller.validateEmailHandler,
            ),
            CommonWidget.instance.rowHeight(),
            InputField(
              controller: controller.registerPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'password'.tr,
              placeholder: 'enter_password'.tr,
              password: true,
              validator: controller.validatePasswordHandler,
            ),
            CommonWidget.instance.rowHeight(),
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
            CommonWidget.instance.rowHeight(height: 10),
            AppCheckbox(
              label: 'conditions_policy'.tr,
              checked: controller.registerTermsChecked,
              onChecked: (val) {
                controller.registerTermsChecked = val!;
              },
            ),
            CommonWidget.instance.rowHeight(height: 35),
            BorderButton(
              text: 'register'.tr.toUpperCase(),
              textColor: Colors.green,
              backgroundColor: Colors.white,
              onPressed: () async {
                await controller.registerHandler(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
