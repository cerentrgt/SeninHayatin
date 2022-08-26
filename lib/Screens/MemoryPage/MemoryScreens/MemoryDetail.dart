import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memory_notebook/MyBackGround/MyBackground.dart';
import 'package:memory_notebook/service/MemoryService.dart';

class MemoryDetail extends StatefulWidget {
  final DocumentSnapshot post;

  MemoryDetail({required this.post, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MemoryDetailState();
  }
}

enum Options { delete, update }

class _MemoryDetailState extends State<MemoryDetail> {

  MemoryService mbService = MemoryService();
  var txtname = TextEditingController();
  var txtMostRecentText = TextEditingController();
  var txtdate = TextEditingController();

  @override
  void initState() {
    txtname.text = widget.post['name'];
    txtdate.text = widget.post['date'];
    txtMostRecentText.text =widget.post['mostRecentText'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text("Seçtiğin Anı : ${widget.post['name']}",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.white)),
        actions: <Widget>[
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              const PopupMenuItem<Options>(
                textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo),
                value: Options.delete,
                child: Text("SİL"),
              ),
              const PopupMenuItem<Options>(
                textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo),
                child: Text("GÜNCELLE"),
                value: Options.update,
              ),
            ],
          ),
        ],
      ),
      body: MyBackGround(
        child: MemoryDetailBody(),
      ),
    );
  }

  MemoryDetailBody() {
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
            buildDateField(),
            SizedBox(height: size.height * 0.03),
            buildNameField(),
            SizedBox(height: size.height * 0.03),
            buildMostRecentTextField(),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  void selectProcess(Options options) async {
    switch (options) {
      case Options.delete:
        mbService.remoweMemory(widget.post.id);
        Navigator.pop(context, true);
        break;
      case Options.update:
        mbService.updateMemory(
            widget.post.id, txtname.text, txtMostRecentText.text, txtdate.text);
        Navigator.pop(context, true);
        break;

      default:
    }
  }

  buildNameField() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "GÜNÜN ÖNEMİNİ ANLATAN İSMİ", hintMaxLines: 15),
      textCapitalization: TextCapitalization.words,
      maxLength: 30,
      controller: txtname,
    );
  }

  buildDateField() {
    return TextField(
      decoration: const InputDecoration(labelText: "GüNÜN TARİHİ"),
      keyboardType: TextInputType.datetime,
      controller: txtdate,
    );
  }

  buildMostRecentTextField() {
    return TextField(
      decoration:
          const InputDecoration(labelText: "YAZMAK İSTEDİĞİN ANIN NEDİR?"),
      textCapitalization: TextCapitalization.words,
      controller: txtMostRecentText,
    );
  }
}
