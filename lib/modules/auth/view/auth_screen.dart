import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_getx/modules/auth/controller/auth_controller.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/constants/common.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/utils/size_config.dart';
import 'package:interview_getx/shared/widgets/button/border_button.dart';
import 'package:interview_getx/shared/widgets/button/gradient_button.dart';

class AuthScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage(
                'assets/images/bg_welcome.png',
              ),
            ),
          ),
          child: Center(
            child: _buildItems(context),
          ),
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                Image.asset(
                  'assets/images/ic_logo_app.png',
                  width: SizeConfig().screenWidth * 0.26,
                  height: SizeConfig().screenWidth * 0.26,
                ),
                const SizedBox(height: 50),
                GradientButton(
                  text: 'login'.tr.toUpperCase(),
                  onPressed: () {
                    Get.toNamed(Routes.AUTH + Routes.LOGIN, arguments: controller);
                  },
                ),
                const SizedBox(height: 20),
                BorderButton(
                  backgroundColor: Colors.white,
                  textColor: Colors.green,
                  text: 'register'.tr.toUpperCase(),
                  onPressed: () {
                    Get.toNamed(Routes.AUTH + Routes.REGISTER, arguments: controller);
                  },
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              '${'version'.tr}: 1.0.0',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: CommonConstants.smallText,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
