
import 'package:flutter/material.dart';
import 'package:memory_notebook/Screens/HomePage/Body.dart';
import '../../MyBackGround/MyDrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("SENİN HAYATIN..!"),
        backgroundColor: Colors.indigo[300],
      ),
      body: const Body(),
    );
  }

}
