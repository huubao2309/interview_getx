import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class MyAppLogger {
  const MyAppLogger(this.prefix);

  final String prefix;

  // ignore: avoid_void_async
  void log({required String content, StackTrace? stackTrace}) async {
    if (kReleaseMode) {
      return;
    }

    developer.log('► $prefix: $content', name: prefix);
  }

  String replaceNewLines(String text) {
    return text.replaceAll('\n', ' ');
  }
}
