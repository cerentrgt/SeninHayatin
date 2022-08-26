import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_notebook/Screens/MemoryPage/MemoryScreens/MemoryList.dart';
import 'package:memory_notebook/service/MemoryService.dart';
import '../../../MyBackGround/MyBackground.dart';

class MemoryAdd extends StatefulWidget {
  const MemoryAdd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MemoryAddState();
}

class _MemoryAddState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ANI EKLE"),
        backgroundColor: Colors.indigo[300],
      ),
      body: MemoryAddBody(),
    );
  }
}

class MemoryAddBody extends StatefulWidget {
  @override
  State<MemoryAddBody> createState() => _MemoryAddBodyState();
}

class _MemoryAddBodyState extends State<MemoryAddBody> {
  MemoryService mbService = MemoryService();

  var txtname = TextEditingController();

  var txtMostRecentText = TextEditingController();

  var txtdate = TextEditingController();

  final ImagePicker pickerImage = ImagePicker();

  dynamic pickImage;

  PickedFile? profileImage;

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
              const Text(
                "ANI OLUŞTUR",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepPurpleAccent),
              ),
              Center(
                child: imagePlace(),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: size.width * 0.3),
                  InkWell(
                    onTap: () =>
                        _onImageButton(ImageSource.camera, context: context),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.indigoAccent,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  InkWell(
                    onTap: () =>
                        _onImageButton(ImageSource.gallery, context: context),
                    child: Icon(
                      Icons.image,
                      color: Colors.indigoAccent,
                      size: 30,
                    ),
                  ),
                ],
              ),
              buildDateField(),
              SizedBox(height: size.height * 0.03),
              buildNameField(),
              SizedBox(height: size.height * 0.03),
              buildMostRecentTextField(),
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
                  if (txtname.text.isEmpty) {
                    nameError();
                  } else if (txtMostRecentText.text.isEmpty) {
                    descipError();
                  } else if (profileImage == null) {
                    imageError();
                  } else if (txtdate.text.isEmpty) {
                    dateError();
                  } else {
                    mbService.addMemory(txtname.text, txtMostRecentText.text,
                        txtdate.text, profileImage!);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MemoryList(),
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

  void dateError() {
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
            title: Text("Lütfen Tarih Ekleyiniz!",style: TextStyle(
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
  void nameError() {
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
            title: Text("Lütfen Günün Önemini Ekleyiniz!",style: TextStyle(
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
  void descipError() {
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
            title: Text("Lütfen Anı Açıklaması Ekleyiniz!",style: TextStyle(
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
  void imageError() {
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
            title: Text("Lütfen Resim Ekleyiniz!",style: TextStyle(
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

  buildNameField() {
    return TextField(
      decoration: const InputDecoration(labelText: "GÜNÜN ÖNEMİ?"),
      textCapitalization: TextCapitalization.words,
      maxLength: 40,
      controller: txtname,
    );
  }

  buildDateField() {
    return TextField(
      decoration: const InputDecoration(labelText: "GÜNÜN TARİHİ"),
      keyboardType: TextInputType.phone,
      maxLength: 10,
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

  Widget imagePlace() {
    double height = MediaQuery.of(context).size.height;
    if (profileImage != null) {
      return CircleAvatar(
        backgroundImage: FileImage(
          File(profileImage!.path),
        ),
        radius: height * 0.08,
      );
    } else {
      if (pickImage != null) {
        return CircleAvatar(
          backgroundImage: NetworkImage(
            pickImage,
          ),
          radius: height * 0.08,
        );
      } else {
        return CircleAvatar(
          backgroundImage: const AssetImage(
            "assets/images/images_6.jpg",
          ),
          radius: height * 0.08,
        );
      }
    }
  }

  void _onImageButton(ImageSource source, {BuildContext? context}) async {
    try {
      final pickedFile = await pickerImage.getImage(source: source);
      setState(() {
        profileImage = pickedFile;
        if (profileImage != null) {}
      });
    } catch (e) {
      setState(() {
        pickImage = e;
        print("Hatamiz :" + pickImage);
      });
    }
  }
}
