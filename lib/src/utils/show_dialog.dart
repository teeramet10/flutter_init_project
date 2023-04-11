import 'package:flutter/material.dart';

Future<void> showDialogError(
  BuildContext context,
) async {
  await Future<dynamic>.delayed(const Duration());
  return showDialog(
      context: Navigator.of(context).overlay!.context,
      useSafeArea: true,
      builder: (BuildContext context) => Container());
}
