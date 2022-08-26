import 'package:flutter/material.dart';

import 'RegisterScreens/RegisterBody.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterBody(),
    );
  }
}
