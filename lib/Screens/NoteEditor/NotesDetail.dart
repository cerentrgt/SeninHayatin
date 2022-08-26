import 'package:flutter/material.dart';
import 'package:memory_notebook/MyBackGround/MyBackground.dart';

import '../../Data/DbHelper.dart';
import '../../models/Events.dart';


class NotesDetail extends StatefulWidget {
  Events post;

  NotesDetail({required this.post, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotesDetailState(post);
  }
}

enum Options { delete, update }

class _NotesDetailState extends State<NotesDetail> {

  Events events;
  _NotesDetailState(this.events);

  var dbHelper = DbHelper();
  var txttitle = TextEditingController();
  var txtcontent = TextEditingController();


  @override
  void initState() {
    txttitle.text = events.title;
    txtcontent.text = events.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text("${events.title}",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.white)),

      ),
      body: MyBackGround(
        child:NotesDetailBody(),
      ),
    );
  }

  NotesDetailBody() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            buildTitleField(),
            SizedBox(height: size.height * 0.03),
            buildContentField(),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              height: 25,
            ),
            updateButton(),
            SizedBox(
              height: 5,
            ),
            deleteButton(),
            SizedBox(
              height: 5,
            ),
            comeToBack(),
          ],
        ),
      ),
    );
  }



  buildTitleField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Not Başlığı"),
      textCapitalization: TextCapitalization.words,
      maxLength: 40,
      controller: txttitle,
    );
  }

  buildContentField() {
    return TextField(
      decoration: const InputDecoration(labelText: "Not İçeriği"),
      keyboardType: TextInputType.text,
      controller: txtcontent,
    );
  }

  Widget deleteButton() {
    return ElevatedButton(
      onPressed: () async{
        await dbHelper.delete(events.id!);
        Navigator.pop(context, true);
      },
      child: Text(
        "Sil",
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        primary: Color(0xFF7C4DFF),
        padding: const EdgeInsets.all(2),
      ),
    );
  }

  Widget comeToBack() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        primary: Color(0xFF7C4DFF),
        padding: const EdgeInsets.all(2),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("Vazgeç",
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: Colors.white),),
    );
  }

  Widget updateButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        primary: Color(0xFF7C4DFF),
        padding: const EdgeInsets.all(2),
      ),
      onPressed: () async{
        await dbHelper.update(Events.withId(id:events.id,title: txttitle.text, content: txtcontent.text));
        Navigator.pop(context, true);
      },
      child: Text(
        "Güncelle",
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }


}
