import 'package:flutter/material.dart';

import '../../MyBackGround/MyDrawer.dart';
import 'AboutTheAppScreens/AboutTheAppScreens.dart';

class AboutTheAppPage extends StatefulWidget {
  const AboutTheAppPage({Key? key}) : super(key: key);

  @override
  State<AboutTheAppPage> createState() => _AboutTheAppPageState();
}

class _AboutTheAppPageState extends State<AboutTheAppPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("UYGULAMA HAKKINDA"),
        backgroundColor: Colors.indigo[300],
      ),
      body: AboutTheAppScreens(),
    );

  }
}
