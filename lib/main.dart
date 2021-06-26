import 'package:flutter/material.dart';

import 'base/di.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();

  runApp(App());
  configLoading();
}
