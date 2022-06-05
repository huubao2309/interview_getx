import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interview_getx/domain/entities/todos/todo_model.dart';
import 'package:interview_getx/modules/home/controller/home_controller.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/styles/text_style.dart';
import 'package:interview_getx/shared/utils/common_widget.dart';

class MainTab extends GetView<HomeController> {
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
            alignment: Alignment.bottomCenter,
            child: Obx(_buildUserName),
          ),
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

  Widget _detailOrderTransaction(TodoItem item, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.HOME + Routes.DETAIL_TODO, arguments: [controller, item]);
      },
      child: Card(
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
                      style: TextAppStyle().bodyTitleTextStyle(),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      item.id.toString(),
                      style: TextAppStyle().bodyContentTextStyle(),
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
                      style: TextAppStyle().bodyTitleTextStyle(),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      item.title ?? '',
                      style: TextAppStyle().bodyContentTextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserName() {
    return Container(
      width: double.infinity,
      height: 30,
      color: Get.theme.primaryColor,
      child: Center(
        child: Text(
          controller.userApp.value ?? 'no_name'.tr,
          style: TextAppStyle().bodyContentTextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
