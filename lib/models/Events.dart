import 'package:cloud_firestore/cloud_firestore.dart';

class Events{
  int? id;
  String title;
  String content;


  Events({ required this.title, required this.content});
  Events.withId({ required this.id, required this.title, required this.content});

  factory Events.fromObject( dynamic o) =>
      Events.withId(
          id: int.tryParse(o["id"].toString()),
          title: o["title"],
          content: o["content"],
         );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = title;
    map["content"] = content;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}