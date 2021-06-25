import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_getx/modules/home/home.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/dialog_request.dart';
import 'package:interview_getx/shared/shared.dart';
import 'package:get/get.dart';

class SettingTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(context, 'setting'.tr.toUpperCase()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Obx(_buildInfoUserWidget),
            _buildLogoutSettingWidget(),
            _buildVersionWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoUserWidget() {
    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 5),
      child: Card(
        color: Colors.white,
        elevation: 4,
        child: Container(
          margin: const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                child: const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                controller.userApp.value ?? 'no_name'.tr,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutSettingWidget() {
    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
      child: GestureDetector(
        onTap: () async {
          final dialogRequest = DialogRequest(title: 'alert'.tr, description: 'has_logout_message'.tr);
          await controller.doShowDialog(dialogRequest);
        },
        child: Card(
          color: Colors.white,
          elevation: 4,
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 66,
                    child: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'logout'.tr,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.navigate_next, color: Colors.green),
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
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              '1.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '© 2021 - Designed by ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'BaoNH',
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
