import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_notebook/Screens/HomePage/MyHomePage.dart';
import 'package:memory_notebook/service/AuthService.dart';

import '../../HomePage/HomeScreens/HomePage.dart';

class UserBody extends StatefulWidget {
  const UserBody({Key? key}) : super(key: key);


  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  AuthService authService = AuthService();

  var userUid = FirebaseAuth.instance.currentUser!.uid;
  var userEmail = FirebaseAuth.instance.currentUser!.email ?? "";
  var userName = FirebaseAuth.instance.currentUser!.displayName ?? "";
  var userProfil = FirebaseAuth.instance.currentUser!.photoURL ?? "";
  String imageUrl = " ";

  void pickUploadGallery() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75);
    Reference ref = FirebaseStorage.instance.ref().child(FirebaseAuth.instance.currentUser!.uid).child("gallery").child("$userUid.jpg");

    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      setState(() {
        imageUrl = value;
      });
      FirebaseAuth.instance.currentUser!.updatePhotoURL(imageUrl);
    });
  }
  void pickUploadCamera() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75);
    Reference ref = FirebaseStorage.instance.ref().child(FirebaseAuth.instance.currentUser!.uid).child("camera").child("$userUid.jpg");

    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      setState(() {
        imageUrl = value;
      });
      FirebaseAuth.instance.currentUser!.updatePhotoURL(imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD1C4E9),
              Color(0xFFB39DDB),
              Color(0xFF9575CD),
              Color(0xFF7E57C2),
            ]),
      ),
      child: Column(
        children: [
          userImageButton(),
          const SizedBox(height: 10),
          userNameButton(),
          userMailButton(),
          goHome(),
          goOut(),
        ],
      ),
    );
  }

  Widget userImageButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [

              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: [
                    userProfil==null
                        ? CircleAvatar(
                      maxRadius: 60,
                      minRadius: 60,
                      backgroundImage: NetworkImage(imageUrl),
                    )
                        : CircleAvatar(
                      maxRadius: 60,
                      minRadius: 60,
                      backgroundImage: NetworkImage(userProfil),
                    ),
                    Positioned(
                      right: -12,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side:
                                const BorderSide(color: Colors.grey, width: 5),
                          ),
                          onPressed: () {
                            showAlertDialog();
                          },
                          child: const Icon(Icons.camera),
                          color: const Color(0xFFF5F6F9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      pickUploadCamera();
                      Navigator.pop(context,true);
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      size: 45,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    onTap: () {
                      pickUploadGallery();
                      Navigator.pop(context,true);
                    },
                    child:const Icon(
                      Icons.image,
                      size: 45,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget userNameButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              fixedSize: Size(320, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    userName,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userMailButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              fixedSize: Size(320, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.mail_outline),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      userEmail,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget goHome() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              fixedSize: Size(320, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
            child: Row(
              children: [
                Icon(Icons.home),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "AnaSayfa'ya Dön",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget goOut() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              fixedSize: Size(320, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              authService.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Çıkış Yap..!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }

}
