import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static MaterialPageRoute<LoginPage> route() => MaterialPageRoute<LoginPage>(
    builder: (BuildContext context) => const LoginPage(),
  );

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
