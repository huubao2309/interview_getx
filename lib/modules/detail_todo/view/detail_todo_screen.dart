import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/styles/text_style.dart';
import 'package:interview_getx/shared/utils/common_widget.dart';
import 'package:intl/intl.dart';

class DetailTodoScreen extends StatefulWidget {
  final controller = Get.arguments[0];
  final item = Get.arguments[1];

  @override
  _DetailTodoScreenState createState() => _DetailTodoScreenState();
}

class _DetailTodoScreenState extends State<DetailTodoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd-MM-yyyy');

    return Scaffold(
      appBar: CommonWidget.appBar(
        context,
        widget.item.title,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Container(
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
                          widget.item.id.toString(),
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
                          widget.item.title,
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
                          '${'user'.tr}: ',
                          style: TextAppStyle().bodyTitleTextStyle(),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.item.user.name,
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
                          '${'created_date'.tr}: ',
                          style: TextAppStyle().bodyTitleTextStyle(),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          formatter.format(widget.item.createdAt),
                          style: TextAppStyle().bodyContentTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
