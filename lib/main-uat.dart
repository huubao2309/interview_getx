import 'package:flutter/material.dart';
import 'package:interview_getx/shared/constants/common.dart';

import 'base/di.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection().init(UAT_ENVIRONMENT);

  runApp(App());
  configLoading();
}
