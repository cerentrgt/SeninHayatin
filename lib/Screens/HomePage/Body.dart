import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memory_notebook/MyBackGround/MyBackground.dart';
import 'package:memory_notebook/Screens/DreamPage/DreamPage.dart';
import 'package:memory_notebook/Screens/MemoryPage/MemoryPage.dart';
import 'package:memory_notebook/Screens/NoteEditor/NotesEditor.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return MyBackGround(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: size.height * 0.05,
            ),
           Image.asset( "assets/images/images-hayat.png",width: 250,height: 250),
            SizedBox(
              height: size.height * 0.05,
            ),
            FloatingActionButton.extended(
                backgroundColor: Colors.lightBlue[100],
                icon:const Icon(
                  Icons.memory,
                  color: Color(0xFF4FC3F7),
                ),
                label: const Text(
                  "ANILARIM ",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Color(0xFF7B1FA2)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const MemoryPage()),
                  );
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            FloatingActionButton.extended(
                backgroundColor: Colors.lightBlue[200],
                icon: Icon(
                  Icons.notes,
                  color:Colors.lightBlue[100],
                ),
                label: Text(
                  "NOTLARIN",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Color(0xFF7B1FA2)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const NotesEditor()),
                  );
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            FloatingActionButton.extended(
                backgroundColor: Colors.lightBlue[300],
                icon: Icon(
                  Icons.wb_sunny,
                  color: Colors.lightBlue[100],
                ),
                label: Text(
                  "HAYALLER ",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Color(0xFF7B1FA2)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const DreamPage()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
