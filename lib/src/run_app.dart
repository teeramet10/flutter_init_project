import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logbook/src/di/injections.dart';
import 'package:logbook/translations/codegen_loader.g.dart';

Future<void> runMyApp(Widget app) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupInjection();

  runApp(
    EasyLocalization(
      child: app,
      supportedLocales: const <Locale>[Locale('en'), Locale('th')],
      startLocale: const Locale('th'),
      saveLocale: true,
      path: 'assets/translations',
      fallbackLocale: const Locale('th'),
      useOnlyLangCode: true,
      useFallbackTranslations: true,
      assetLoader: const CodegenLoader(),
    ),
  );
}
