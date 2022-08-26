import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memory_notebook/MyBackGround/MyBackground.dart';
import 'package:memory_notebook/service/StatusService.dart';

class DreamDetail extends StatefulWidget {
  final DocumentSnapshot post;

  const DreamDetail({required this.post, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DreamDetailState();
  }
}

enum Options { delete, update }

class DreamDetailState extends State<DreamDetail> {
  StatusService statusService = StatusService();
  var txtDescriptions = TextEditingController();

  @override
  void initState() {
    txtDescriptions.text = widget.post['status'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text("Düzenleme",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.white)),
      ),
      body: MyBackGround(
        child: DreamDetailBody(),
      ),
    );
  }

  DreamDetailBody() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "SEÇTİĞİN ANININ İÇERİĞİ",
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            buildNameField(),
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

  Widget deleteButton() {
    return ElevatedButton(
      onPressed: () {
        statusService.removeStatus(widget.post.id);
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
      onPressed: () {
        statusService.updateStatus(widget.post.id, txtDescriptions.text);
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

  buildNameField() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Hayal Açıklaması", hintMaxLines: 15),
      textCapitalization: TextCapitalization.words,
      controller: txtDescriptions,
    );
  }
}
