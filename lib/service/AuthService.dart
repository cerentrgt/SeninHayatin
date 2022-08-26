import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:memory_notebook/service/StorageService.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final StorageService storageService = StorageService();

  String mediaUrl = "";

  Future<User?> signIn(String email, String password) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  signOut() async {
    return await auth.signOut();
  }

  Future<User?> createPerson(
    String name,
    String email,
    String password,
    String phoneNumber,
  ) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? users = user.user;
    users!.updateDisplayName(name);

    await firestore.collection("Person").doc(user.user?.uid).set({
      'userName': name,
      'email': email,
      'phoneNumber': phoneNumber,
    });

    return user.user;
  }

  Future<UserCredential> signInWithGoggle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return auth.signInWithCredential(credential);
  }

  Future<void> passwordReset(BuildContext context, String email) async{
    var reset = await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) => Navigator.of(context).pop());

    return reset;
  }
}
