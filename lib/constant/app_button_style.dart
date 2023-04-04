import 'package:example_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:example_project/constant/app_dimensions.dart';
import 'package:example_project/constant/app_theme.dart';

class AppButtonStyle {
  static ButtonStyle base(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorName.primaryLight;
          }
          return ColorName.primary;
        },
      ),
      minimumSize: MaterialStateProperty.all<Size>(
        const Size(
          AppDimensions.zero,
          AppDimensions.size52,
        ),
      ),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) {
          return TextStyle(
            fontFamily: AppTheme.fontFamily,
            color: ColorName.white,
          );
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.size100),
        ),
      ),
    );
  }
}
