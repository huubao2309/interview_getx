import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_getx/modules/auth/auth.dart';
import 'package:interview_getx/routes/routes.dart';
import 'package:interview_getx/shared/shared.dart';
import 'package:get/get.dart';

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
        Center(
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
                text: 'Login'.toUpperCase(),
                onPressed: () {
                  Get.toNamed(Routes.AUTH + Routes.LOGIN, arguments: controller);
                },
              ),
              const SizedBox(height: 20),
              BorderButton(
                backgroundColor: Colors.white,
                textColor: Colors.green,
                text: 'Register'.toUpperCase(),
                onPressed: () {
                  Get.toNamed(Routes.AUTH + Routes.REGISTER, arguments: controller);
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Version: 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: CommonConstants.smallText,
                color: ColorConstants.tipColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
