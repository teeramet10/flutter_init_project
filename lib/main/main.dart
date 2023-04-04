import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:example_project/app/app.dart';
import 'package:example_project/constant/env_constant.dart';

void main() {
  FlavorConfig(
    name: 'PROD',
    variables: <String, dynamic>{
      EnvConstant.debug: true,
      EnvConstant.baseURL: '',
    },
  );
  runApp(const MyApp());
}

