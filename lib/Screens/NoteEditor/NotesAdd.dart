import 'package:flutter/material.dart';
import 'package:memory_notebook/Data/DbHelper.dart';
import 'package:memory_notebook/Screens/NoteEditor/NotesEditor.dart';
import 'package:memory_notebook/models/Events.dart';
import '../../../MyBackGround/MyBackground.dart';

class NotesAdd extends StatefulWidget {
  const NotesAdd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotesAddState();
}

class _NotesAddState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Ekle"),
        backgroundColor: Colors.indigo[300],
      ),
      body: NotesAddBody(),
    );
  }
}

class NotesAddBody extends StatefulWidget {
  @override
  State<NotesAddBody> createState() => _NotesAddBodyState();
}

class _NotesAddBodyState extends State<NotesAddBody> {
  var txttitle = TextEditingController();

  var txtcontent = TextEditingController();

  var dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.deepPurpleAccent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    );


    return MyBackGround(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              buildTitleField(),
              SizedBox(height: size.height * 0.03),
              buildContentField(),
              SizedBox(height: size.height * 0.03),
              ElevatedButton(
                style: style,
                child: const Text(
                  "KAYDET",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.white),
                ),
                onPressed: () {
                  if(txttitle.text.isEmpty){
                    titleError();
                  }else if(txtcontent.text.isEmpty){
                    contentError();
                  }else{
                    dbHelper.insert(
                        Events(title: txttitle.text, content: txtcontent.text));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotesEditor(),
                      ),
                    );
                  }

                },
              ),
            ],
          ),
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
  void titleError() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            backgroundColor: Colors.deepPurple,
            title: Text("Lütfen Notunuza Başlık Ekleyiniz!",style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic
            ),),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text("Geri Dön"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void contentError() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            backgroundColor: Colors.deepPurple,
            title: Text("Lütfen Not Ekleyin!",style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic
            ),),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text("Geri Dön"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
