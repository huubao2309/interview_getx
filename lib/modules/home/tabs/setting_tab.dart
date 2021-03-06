import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/modules/home/controller/home_controller.dart';
import 'package:interview_getx/shared/styles/icon_style.dart';
import 'package:interview_getx/shared/styles/text_style.dart';
import 'package:interview_getx/shared/utils/common_widget.dart';
import 'package:interview_getx/shared/widgets/switch_widget/switch_widget.dart';

class SettingTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.instance.appBar(context, 'setting'.tr.toUpperCase()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildInfoUserWidget(),
            const SizedBox(height: 20),
            // _buildThemeSettingWidget(context),
            _buildLanguageSettingWidget(),
            _buildLogoutSettingWidget(),
            _buildVersionWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoUserWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 5),
      child: Card(
        elevation: 4,
        child: Container(
          margin: const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor: Get.theme.primaryColor,
                  child: Icon(
                    Icons.account_circle,
                    color: NormalIconStyle().iconTextColor,
                    size: NormalIconStyle().size,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                controller.userApp.value ?? 'no_name'.tr,
                style: TextAppStyle.instance.bodyContentTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSettingWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: GestureDetector(
        onTap: () async {
          await controller.changeLanguage();
        },
        child: Card(
          elevation: 4,
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    backgroundColor: Get.theme.primaryColor,
                    child: Icon(
                      Icons.translate,
                      color: NormalIconStyle().iconTextColor,
                      size: NormalIconStyle().size,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'translate'.tr,
                  style: TextAppStyle.instance.bodyContentTextStyle(),
                ),
                const Spacer(),
                Icon(Icons.navigate_next, color: Get.theme.primaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThemeSettingWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: Card(
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 1, bottom: 1),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor: context.theme.primaryColor,
                  child: Icon(
                    Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: NormalIconStyle().iconTextColor,
                    size: NormalIconStyle().size,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'theme'.tr,
                style: TextAppStyle.instance.bodyContentTextStyle(),
              ),
              const Spacer(),
              // Icon(Icons.navigate_next, color: context.theme.primaryColor),
              Obx(() {
                return SwitchWidget(
                  value: controller.isDarkMode.value,
                  onChanged: (value) async {
                    await controller.changeTheme();
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutSettingWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
      child: GestureDetector(
        onTap: () async {
          await controller.confirmLogout();
        },
        child: Card(
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    backgroundColor: Get.theme.primaryColor,
                    radius: 66,
                    child: Icon(
                      Icons.power_settings_new,
                      color: NormalIconStyle().iconTextColor,
                      size: NormalIconStyle().size,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'logout'.tr,
                  style: TextAppStyle.instance.bodyContentTextStyle(),
                ),
                const Spacer(),
                Icon(Icons.navigate_next, color: Get.theme.primaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVersionWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'version'.tr,
              style: TextAppStyle.instance.versionTextStyle(),
            ),
            const SizedBox(width: 5),
            Text(
              '1.0.0',
              style: TextAppStyle.instance.versionTextStyle(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '?? 2021 - Designed by ',
              style: TextAppStyle.instance.prefixDesignTextStyle(),
            ),
            Text(
              'BaoNH',
              style: TextAppStyle.instance.suffixDesignTextStyle(),
            ),
          ],
        ),
      ],
    );
  }
}
