import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../config/config_environment.dart';
import '../../../data/graphql/query/demo_query_graphql.dart';
import '../../../modules/home/controller/home_controller.dart';
import '../../../shared/utils/common_widget.dart';

class MainTab extends GetView<HomeController> {
  final config = Get.find<EnvConfiguration>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(context, 'home'.tr.toUpperCase()),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Obx(_listTodoWidget),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _buildUserName(),
          )
        ],
      ),
    );
  }

  Widget _listTodoWidget() {
    return Scrollbar(
      controller: controller.scrollController,
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollEnd) {
          final metrics = scrollEnd.metrics;
          if (metrics.atEdge) {
            if (metrics.pixels == 0) {
              print('At top ListView');
            } else {
              // At Bottom ListView
              if (controller.totalListItems.isNotEmpty &&
                  controller.totalListItems.length >= controller.offsetItem.value + controller.stepLimitItem &&
                  !controller.isLoadingMore) {
                controller
                  ..isLoadingMore = true
                  ..loadListTodo(limit: controller.stepLimitItem, offset: controller.offsetItem.value + controller.stepLimitItem)
                  ..isLoadingMore = false;
              }
            }
          }
          return true;
        },
        child: ListView.builder(
          itemCount: controller.totalListItems.length,
          controller: controller.scrollController,
          itemBuilder: (context, index) {
            return ListTile(
              title: _detailOrderTransaction(controller.totalListItems[index], index),
            );
          },
        ),
      ),
    );
  }

  Widget _detailOrderTransaction(GetActiveTodos$Query$TodosSelectColumn item, int index) {
    return Card(
      color: const Color(0xFFfffbd5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Container(
        height: 80,
        width: Get.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    '${'id'.tr}: ',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    item.id.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  Text(
                    '${'title'.tr}: ',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserName() {
    return Container(
      width: Get.width,
      height: 30,
      color: Colors.green,
      child: Center(
        child: Text(
          controller.userApp.value ?? 'no_name'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
