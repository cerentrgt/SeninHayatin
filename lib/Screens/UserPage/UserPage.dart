import 'package:flutter/material.dart';
import 'package:memory_notebook/Screens/UserPage/UserScreens/UserScreens.dart';


class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserScreensState();
}

class _UserScreensState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserScreens(),
    );
  }
}
