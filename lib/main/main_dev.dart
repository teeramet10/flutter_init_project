import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:example_project/app/app.dart';
import 'package:example_project/constant/env_constant.dart';
import 'package:example_project/main/run_app.dart';

void main() {
  FlavorConfig(
    name: 'DEV',
    variables: <String, dynamic>{
      EnvConstant.debug: true,
      EnvConstant.baseURL: '',
    },
  );
  runMyApp(const MyApp());
}
