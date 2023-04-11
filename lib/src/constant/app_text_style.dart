import 'package:logbook/gen/colors.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:logbook/src/constant/app_theme.dart';

class AppTextStyle {
  static TextStyle baseStyle = TextStyle(fontFamily: AppTheme.fontFamily);

  static TextStyle title = baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorName.black,
    height: 24 / 18,
  );

  static TextStyle textForm = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: ColorName.black,
    height: 16 / 16,
  );
}
