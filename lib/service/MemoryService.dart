import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_notebook/models/MemoryItemModel.dart';
import 'package:memory_notebook/service/StorageService.dart';

class MemoryService{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  StorageService storageService = StorageService();
  String mediaUrl = "";

  Future<MemoryItemModel> addMemory(String name,String mostRecentText,
  String date,PickedFile pickedFile) async {
    var ref = firestore
        .collection("Person")
        .doc(auth.currentUser!.uid)
        .collection("Memory");

    if (pickedFile == null) {
      mediaUrl = "";
    } else {
      mediaUrl = await storageService.uploadMemoryMedia(
        File(pickedFile.path),
      );
    }

    var documentRef = await ref.add({
      'name': name,
      'mostRecentText':mostRecentText,
      'date':date,
      'image':mediaUrl
    });
    return MemoryItemModel(id: documentRef.id, name: name, mostRecentText: mostRecentText, date: date,image: mediaUrl);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMemory() {
    var ref = firestore
        .collection("Person")
        .doc(auth.currentUser!.uid)
        .collection("Memory")
        .snapshots();
    return ref;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getImage(){
    var ref = firestore.collection("Person").doc(auth.currentUser!.uid).collection("Memory").doc("image").snapshots();
    return ref;
  }



  Future<void> remoweMemory(String docId) {
    var ref = firestore
        .collection("Person")
        .doc(auth.currentUser!.uid)
        .collection("Memory")
        .doc(docId)
        .delete();
    return ref;
  }
  Future<void> updateMemory(String docId,String name,String mostRecentText,String date) {
    var ref = firestore
        .collection("Person")
        .doc(auth.currentUser!.uid)
        .collection("Memory")
        .doc(docId)
        .update({
      'name': name,
      'mostRecentText':mostRecentText,
      'date':date,
    });
    return ref;
  }
}