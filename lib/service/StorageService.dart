import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService{
  final FirebaseStorage _firebaseStorage=FirebaseStorage.instance;

  
  Future<String> uploadMedia(File file) async{
    final userUid=FirebaseAuth.instance.currentUser!.uid;

    var uploadTask=_firebaseStorage.ref().child(
      "${userUid}.${file.path.split('.').last}"
    ).putFile(file);

    uploadTask.snapshotEvents.listen((event){});

    var storageRef= await uploadTask;

    return await storageRef.ref.getDownloadURL();

  }
  Future<String> uploadMemoryMedia(File file) async{
    final userUid=FirebaseAuth.instance.currentUser!.uid;

    var uploadTask=_firebaseStorage.ref().child("memory").child(
        "${userUid}.${file.path.split('.').last}"
    ).putFile(file);

    uploadTask.snapshotEvents.listen((event){});

    var storageRef= await uploadTask;

    return await storageRef.ref.getDownloadURL();

  }

  
}