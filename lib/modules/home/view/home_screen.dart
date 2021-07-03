import 'package:flutter/material.dart';
import 'package:interview_getx/modules/home/controller/home_controller.dart';
import 'package:interview_getx/modules/home/tabs/tabs.dart';

import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(_buildWidget),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Center(
        child: _buildContent(controller.currentTab.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavigationBarItem(
            'home'.tr,
            MainTabs.home == controller.currentTab.value
                ? const Icon(
                    Icons.home,
                    size: 16,
                  )
                : const Icon(
                    Icons.home,
                    size: 14,
                  ),
          ),
          _buildNavigationBarItem(
            'setting'.tr,
            MainTabs.setting == controller.currentTab.value
                ? const Icon(
                    Icons.settings,
                    size: 16,
                  )
                : const Icon(
                    Icons.settings,
                    size: 14,
                  ),
          )
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Get.theme.textTheme.headline5!.color,
        unselectedItemColor: Get.theme.textTheme.headline6!.color,
        selectedIconTheme: IconThemeData(
          color: Get.theme.textTheme.headline5!.color,
        ),
        unselectedIconTheme: IconThemeData(
          color: Get.theme.textTheme.headline6!.color,
        ),
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Get.theme.textTheme.headline5!.color,
        ),
        onTap: (index) => controller.switchTab(index),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return controller.mainTab;
      case MainTabs.setting:
        return controller.settingTab;
      default:
        return controller.mainTab;
    }
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, Widget icon) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
