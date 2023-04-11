import 'dart:convert';

import 'package:flutter/services.dart';

class JSONLoaderUtil {
  static Future<T> loadFile<T>(String path, T Function(dynamic json) builder,
      {Duration delay = const Duration(milliseconds: 200)}) async {
    await Future<Duration>.delayed(delay);
    final String str = await rootBundle.loadString(path);
    final dynamic json = jsonDecode(str);
    return builder(json);
  }
}
