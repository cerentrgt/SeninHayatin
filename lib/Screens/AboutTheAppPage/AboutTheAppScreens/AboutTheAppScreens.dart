import 'package:flutter/material.dart';

import 'AboutTheAppBody.dart';

class AboutTheAppScreens extends StatefulWidget {
  const AboutTheAppScreens({Key? key}) : super(key: key);

  @override
  State<AboutTheAppScreens> createState() => _AboutTheAppScreensState();
}

class _AboutTheAppScreensState extends State<AboutTheAppScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutTheAppBody(),
    );
  }
}


