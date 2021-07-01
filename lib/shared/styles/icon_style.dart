import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/styles/text_style.dart';

class NormalIconStyle {
  Color? get iconTextColor => TextAppStyle().bodyWhiteTextStyle().color;

  double? get size => 16;
}

class SmallIconStyle {
  Color? get iconTextColor => Get.theme.textTheme.headline6!.color;

  double? get size => 14;
}
