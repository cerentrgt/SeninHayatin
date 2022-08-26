import 'package:cloud_firestore/cloud_firestore.dart';

class MemoryItemModel {
  String id;
  String name;
  String mostRecentText;
  String date;
  String? image;

  MemoryItemModel(
      {required this.id,
      required this.name,
      required this.mostRecentText,
      required this.date,
       this.image});

  factory MemoryItemModel.fromSnapshot(DocumentSnapshot snapshot) {
    return MemoryItemModel(
        id: snapshot.id,
        name: snapshot["name"],
        mostRecentText: snapshot["mostRecentText"],
        date: snapshot["date"],
        image: snapshot["image"]);
  }
}
