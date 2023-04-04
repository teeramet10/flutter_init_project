import 'package:example_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:example_project/constant/app_dimensions.dart';
import 'package:example_project/constant/app_text_style.dart';
import 'package:example_project/utils/color_util.dart';

class AppTheme {
  static ColorScheme colorScheme = ColorScheme.fromSwatch(
    primarySwatch: generateMaterialColor(ColorName.primary),
  );

  final ThemeData themeData = ThemeData(
    errorColor: ColorName.red,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: AppDimensions.zero,
      backgroundColor: ColorName.white,
      titleTextStyle: AppTextStyle.title,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(
            AppDimensions.zero,
            AppDimensions.size52,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.size100),
          ),
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            return TextStyle(
              fontFamily: fontFamily,
              color: ColorName.white
            );
          },
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.size100),
          ),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: ColorName.black,
      ),
    ),
    dividerTheme: const DividerThemeData(
      space: AppDimensions.sizePoint5,
      thickness: AppDimensions.sizePoint5,
      indent: AppDimensions.size16,
      endIndent: AppDimensions.size16,
    ),
    dividerColor: ColorName.divider,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme().apply(
      fontFamily: fontFamily,
    ),
    primaryTextTheme: const TextTheme().apply(
      fontFamily: fontFamily,
    ),
  );

  static String get fontFamily => 'Kanit';

  static List<BoxShadow> get boxShadow => const <BoxShadow>[
        BoxShadow(
          color: ColorName.shadow,
          offset: Offset(0, 11),
          blurRadius: AppDimensions.size15,
        )
      ];
}
