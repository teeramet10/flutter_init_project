import 'package:flutter/material.dart';
import 'package:logbook/gen/colors.gen.dart';
import 'package:logbook/src/constant/app_dimensions.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({Key? key}) : super(key: key);

  @override
  Widget build([BuildContext? context]) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorName.primary),
          strokeWidth: AppDimensions.size6,
        ),
      ),
    );
  }
}

class DialogLoadingController {
  DialogLoadingController();

  BuildContext? context;

  bool isLoading = false;

  Future<void> show(BuildContext context) {
    this.context = context;
    isLoading = true;
    return showDialog(
      context: this.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const DialogLoading();
      },
    );
  }

  void hide() {
    if (context != null && isLoading) {
      isLoading = false;
      Navigator.pop(context!);
    }
  }

  void dispose() {
    context = null;
  }
}
