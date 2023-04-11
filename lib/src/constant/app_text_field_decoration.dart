import 'package:flutter/material.dart';
import 'package:logbook/gen/colors.gen.dart';
import 'package:logbook/src/constant/app_text_style.dart';

class TextFormFieldDecoration {
  static InputDecoration baseDecoration = InputDecoration(
    border: InputBorder.none,
    hintStyle: AppTextStyle.textForm.copyWith(color: ColorName.hint),
  );
}
