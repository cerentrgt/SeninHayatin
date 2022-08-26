import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:memory_notebook/Data/DbHelper.dart';
import 'package:memory_notebook/Screens/NoteEditor/NotesAdd.dart';
import 'package:memory_notebook/Screens/NoteEditor/NotesDetail.dart';

import '../../models/Events.dart';

class NotesEditor extends StatefulWidget {
  const NotesEditor({Key? key}) : super(key: key);

  @override
  State<NotesEditor> createState() => _NotesEditorState();
}

class _NotesEditorState extends State<NotesEditor> {
  var dbHelper = DbHelper();

  List<Events>? events;
  int eventCount = 0;

  @override
  void initState() {
    getEvents();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notlarım"),
        backgroundColor: Color(0xFF9575CD),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF9575CD),
        onPressed: () {
          goToEventsAdd();
        },
        child: Icon(Icons.edit_outlined,),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 3,
        itemCount: eventCount,
        itemBuilder: (context, int index) {
          return Card(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            child: ListTile(
              title: Text(
                events![index].title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,

                ),
              ),
              subtitle: Text(
             events![index].content,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: 13),
              ),
              onTap: () {
                goToDetail(events![index]);
              },
            ),
          );
        },
        staggeredTileBuilder: (index) => index % 5 == 0
            ? StaggeredTile.count(2, 2)
            : StaggeredTile.count(1, 1),
      ),
    );
  }

  void goToEventsAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotesAdd()));
    if (result != null) {
      if (result) {
        getEvents();
      }
    }
  }

  void getEvents() {
    var memoriesFuture = dbHelper.getEvents();

    memoriesFuture.then((data) {
      setState(() {
        this.events = data;
        eventCount = data.length;
      });
    });
  }

  void goToDetail(Events events) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotesDetail(
          post: events,
        ),
      ),
    );
    if (result != null) {
      if (result) {
        getEvents();
      }
    }
  }
}
