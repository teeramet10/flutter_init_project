import 'package:flutter/services.dart';

class QRCodeUtils {
  static const MethodChannel platform = MethodChannel('qrcode');

  static Future<String> readQrcode(String? filePath) async {
    try {
      final String result =
          await platform.invokeMethod('readQRCode', <String,String?>{'filePath': filePath});
      return result;
    } on PlatformException catch (_) {
      return '';
    }
  }
}
