import 'package:example_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:example_project/constant/app_text_style.dart';

class TextFormFieldDecoration {
  static InputDecoration baseDecoration = InputDecoration(
    border: InputBorder.none,
    hintStyle: AppTextStyle.textForm.copyWith(
      color: ColorName.hint
    ),
  );
}
