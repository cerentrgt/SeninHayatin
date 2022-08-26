import 'package:flutter/material.dart';
import 'package:memory_notebook/MyBackGround/MyBackground.dart';
import 'package:memory_notebook/MyBackGround/MyDrawer.dart';
import 'package:memory_notebook/Screens/MemoryPage/MemoryScreens/MemoryList.dart';
import 'MemoryScreens/MemoryAdd.dart';

class MemoryPage extends StatelessWidget {
  const MemoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("ANILARIN"),
        backgroundColor: Colors.indigo[300],
      ),
      body: const MemoryBody(),
    );
  }
}

class MemoryBody extends StatelessWidget {
  const MemoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MyBackGround(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: size.height * 0.05,
          ),
           Image.asset(
             "assets/images/images-anılar.png",
            width: 250,
            height: 200,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          FloatingActionButton.extended(
              heroTag: "btn1",
              enableFeedback: true,
              backgroundColor: Colors.lightBlue[200],
              icon: const Icon(
                Icons.list,
                color: Color(0xFF4FC3F7),
              ),
              label: const Text(
                "ANILARI LİSTELE ",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Color(0xFF7B1FA2)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MemoryList()),
                );
              }),
          SizedBox(
            height: size.height * 0.05,
          ),
          FloatingActionButton.extended(
              heroTag: "btn2",
              backgroundColor: Colors.lightBlue[300],
              icon: const Icon(
                Icons.add_box_outlined,
                color: Color(0xFFB3E5FC),
              ),
              label: const Text(
                "ANI EKLE ",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Color(0xFF7B1FA2)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MemoryAdd()),
                );
              }),
          SizedBox(
            height: size.height * 0.05,
          ),
        ]),
      ),
    );
  }
}
