import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memory_notebook/MyBackGround/MyBackground.dart';
import 'package:memory_notebook/Screens/MemoryPage/MemoryScreens/MemoryAdd.dart';
import 'package:memory_notebook/service/MemoryService.dart';

import 'MemoryDetail.dart';

class MemoryList extends StatefulWidget {
  const MemoryList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MemoryListState();
}

class _MemoryListState extends State {
  MemoryService mbService=MemoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ANILARIM"),
        backgroundColor: Colors.indigo[300],
      ),
      body: MyBackGround(
        child: _body(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[300],
        onPressed: () {
          goToMemoryAdd();
        },
        child: const Icon(Icons.add),
        tooltip: "anı ekle",
      ),
    );
  }
  StreamBuilder _body() {
    return StreamBuilder<QuerySnapshot>(
        stream: mbService.getMemory(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const CircularProgressIndicator(

            color: Colors.indigo,

          )

              : snapshot.data == null
              ? const CircularProgressIndicator(
            color: Colors.indigo,
          )
              : MemoryListBody(snapshot);
        });
  }

  ListView MemoryListBody(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data?.docs.length ?? 0,
        itemBuilder: (context, index) {
          DocumentSnapshot mypost = snapshot.data!.docs[index];
          return Card(
            color: Colors.blue[100],
            elevation: 2.0,
            child: ListTile(
              leading:Image.network(mypost['image'],width: 90,height: 90,) ,
              title: Text(
                mypost['name'],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[700],
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
              ),
              subtitle: Text(
                mypost['mostRecentText'],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent[200],
                    fontStyle: FontStyle.italic,
                    fontSize: 13),
              ),
              onTap: () {
             goToDetail(mypost);
              },
            ),
          );
        });
  }

  void goToMemoryAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MemoryAdd()));
  }

  void goToDetail(DocumentSnapshot post) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemoryDetail(post: post),
        ),
      );
  }
}
