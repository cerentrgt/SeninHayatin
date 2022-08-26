import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memory_notebook/Screens/AboutTheAppPage/AboutTheAppPage.dart';
import 'package:memory_notebook/Screens/DreamPage/DreamPage.dart';
import 'package:memory_notebook/Screens/HavaDurumu/HavaDurumuPage.dart';
import 'package:memory_notebook/Screens/MemoryPage/MemoryPage.dart';
import 'package:memory_notebook/Screens/NoteEditor/NotesEditor.dart';
import 'package:memory_notebook/Screens/UserPage/UserScreens/UserScreens.dart';
import 'package:memory_notebook/service/AuthService.dart';
import '../Screens/HomePage/HomeScreens/HomePage.dart';
import '../Screens/HomePage/MyHomePage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var authService = AuthService();
  var txtEmail = FirebaseAuth.instance.currentUser!.email ?? "";
  var txtName = FirebaseAuth.instance.currentUser!.displayName ?? "";
  var userProfil = FirebaseAuth.instance.currentUser!.photoURL ??
      "https://dbdzm869oupei.cloudfront.net/img/sticker/preview/20084.png";



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.indigo[200],
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15
          ),
          children: [
            SizedBox(
              height: 15,
            ),
            buildUser(),
            Divider(color: Colors.white, height: 20, thickness: 2),
            buildProfil(),
            buildHome(),
            buildMemory(),
            buildPlans(),
            buildDreams(),
            Divider(
                color: Colors.white,
                height: 20,
                thickness: 1,
                indent: 25,
                endIndent: 25),
            buildExample(),
            buildDescription(),
            goOutButton(),
          ],
        ),
      ),
    );
  }

  Widget buildUser() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreens(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(userProfil),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txtName,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    txtEmail,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfil() {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.account_circle),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreens(),
          ),
        );
      },
      title: Text(
        "Profil",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget buildMemory() {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.memory,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MemoryPage(),
          ),
        );
      },
      title: Text(
        "Anıların",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget buildPlans() {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.notes,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotesEditor(),
          ),
        );
      },
      title: Text(
        "Notların",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }


  Widget buildExample() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://pbs.twimg.com/profile_images/1667413124/weather_400x400.png",
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HavaDurumuPage(),
          ),
        );
      },
      title: Text(
        "Hava Durumu",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget buildDreams() {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.wb_sunny,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DreamPage(),
          ),
        );
      },
      title: Text(
        "Hayallerin",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget buildHome() {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      leading: CircleAvatar(
        child: Icon(Icons.home),
      ),
      title: Text(
        "AnaSayfa",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget buildDescription() {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutTheAppPage(),
          ),
        );
      },
      leading: CircleAvatar(
        child: Icon(Icons.description),
      ),
      title: Text(
        "Uygulama Hakkında",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }


  Widget goOutButton() {
    return ListTile(
      onTap: () {
        authService.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
      leading: CircleAvatar(
        child: Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
      title: Text(
        "Çıkış Yap",
        style: TextStyle(
          color: Colors.redAccent[700],
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }


}
