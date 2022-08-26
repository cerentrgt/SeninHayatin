import 'package:memory_notebook/models/Events.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  Database? _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await initalizeDb();
    }
    return _db!;
  }

  Future<Database> initalizeDb() async {
    String dbPath = join(await getDatabasesPath(), "event.db");
    var eventDb = openDatabase(dbPath, version: 1, onCreate: createDb);
    return eventDb;
  }

  void createDb(Database db, int version) async {
    await db.execute("Create table events("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        "content TEXT"
        ")");
  }
  Future<List<Events>> getEvents() async{
    Database db=await this.db;
    var result=await db.query("events");
    return List.generate(result.length, (i) => Events.fromObject(result[i]));
  }

  Future<int> insert(Events events) async{
    Database db=await this.db;
    var result=await db.insert("events", events.toMap());
    return result;
  }
  Future<int> delete(int id) async{
    Database db=await this.db;
    var result=await db.rawDelete("delete from events where id= $id");
    return result;
  }

  Future<int> update(Events event) async{
    Database db=await this.db;
    var result=await db.update("events", event.toMap(),where: "id=?",whereArgs: [event.id]);
    return result;
  }


}