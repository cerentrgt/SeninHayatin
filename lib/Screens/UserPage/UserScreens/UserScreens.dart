import 'package:flutter/material.dart';
import 'UserBody.dart';

class UserScreens extends StatefulWidget {
  const UserScreens({Key? key}) : super(key: key);

  @override
  State<UserScreens> createState() => _UserScreensState();
}

class _UserScreensState extends State<UserScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        title: Text("PROFİL"),
        backgroundColor:  Color(0xFF9575CD),
      ),
      body: UserBody(),
    );
  }
}
