import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:logbook/src/run_app.dart';
import 'package:logbook/src/app/app.dart';
import 'package:logbook/src/constant/env_constant.dart';

void main()  {
  FlavorConfig(
    name: 'DEV',
    variables: <String, dynamic>{
      EnvConstant.debug: true,
      EnvConstant.baseURL: '',
    },
  );
   runMyApp(const MyApp());
}
