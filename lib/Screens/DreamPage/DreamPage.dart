import 'package:flutter/material.dart';
import 'package:memory_notebook/MyBackGround/DreamBackground.dart';
import 'package:memory_notebook/Screens/DreamPage/DreamScreens/DreamAdd.dart';
import 'package:memory_notebook/Screens/DreamPage/DreamScreens/DreamList.dart';

import '../../MyBackGround/MyDrawer.dart';


class DreamPage extends StatefulWidget {
  const DreamPage({Key? key}) : super(key: key);

  @override
  State<DreamPage> createState() => _DreamPageState();
}

class _DreamPageState extends State<DreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("HAYALLERİN"),
        backgroundColor: Colors.indigo[300],
      ),
      body: const DreamBody(),
    );
  }
}

class DreamBody extends StatelessWidget {
  const DreamBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DreamBackground(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
                width: size.width,
              ),
              const Text(
                "GELECEK HAYALLERİNİN PEŞİNİ BIRAKMAYANLARINDIR..!",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.indigoAccent,
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: size.height * 0.07,
                width: size.width,
              ),
              Row(
                children: [
                  FloatingActionButton.extended(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.lightBlue[200],
                      icon: const Icon(
                        Icons.list,
                        color: Color(0xFF4FC3F7),
                      ),
                      label: const Text(
                        "HAYALLERİNİ LİSTELE ",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            color: Color(0xFF7B1FA2)),
                        textAlign: TextAlign.left,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DreamList(),
                          ),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
                width: size.width,
              ),
              const Text(
                "HAYALLERİNİZİN SON KULLANMA TARİHİ YOK. DERİN BİR NEFES ALIN VE YENİDEN DENEYİN.ASLA VAZGECMEYİN..!",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.indigoAccent,
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: size.height * 0.07,
                width: size.width,
              ),
              Row(
                children: [
                  FloatingActionButton.extended(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.lightBlue[200],
                      icon: const Icon(
                        Icons.wb_sunny,
                        size: 30,
                        color: Color(0xFF4FC3F7),
                      ),
                      label: const Text(
                        "HAYALLER OLUŞTUR ",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            color: Color(0xFF7B1FA2)),
                        textAlign: TextAlign.left,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DreamAdd(),
                          ),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
                width: size.width,
              ),
              const Text(
                "HAYALİNİZİN PEŞİNDEN GİTMEYE BAŞLADIĞINIZ AN, HAYATINIZDA HER ŞEY ANLAM KAZANIR..!",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.indigoAccent,
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
