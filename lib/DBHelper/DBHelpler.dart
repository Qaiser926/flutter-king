import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_toastr/flutter_toastr.dart';

class NotesDatabase {
  static final NotesDatabase intance = NotesDatabase._init();
  static Database
      _database; // yaha par ye check kare ga k db me he k nhe agr he to add kare ga

  NotesDatabase._init(); // yaha par inilize kia

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _inilializedDB('Notes.db');
    return _database; // yaaha par check kare ga k pehle see data k nhe our aga he to add kare our agr nhe he to null return kare ga
  } // check kare k inilized ka name koch he k nhe

  Future<Database> _inilializedDB(String filepath) async {
    final dbPath =
        await sql.getDatabasesPath(); // check kare ga k db he kaaha par
    // pir yaha par db ko kaha see kaha tak move karna he
    final path = join(dbPath, filepath);
    return await sql.openDatabase(path, version: 1, onCreate: _createDb);
  } // to create db

// ye niche create db create kare gi db, our us me hum raw db dale ge db query run kare gi
  Future _createDb(Database db, int versin) async {
    await db.execute('''
    CREATE TABLE NotestableNo1(
     // // fieldName FieldDataType
      id INTEGER PEIMARY KEY AUTOINREMENT,
      pin BOOLEAN NOT NULL,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      createdTime TEXT NOT NULL,


    )
    '''); // upar jab atoincrement ho gi to null kabi nhe ho gi our auto na to define kar satke he
  }
  // insertEntry bata de ga k entry howi k nhe

  Future<bool> InsertEntry() async {
    final db = await await intance.database; // instance save kar diya
    final id = await db.insert('NotestableNo1', {
      'pin': 0,
      "title": "This is my title",
      "content": "this is my note content",
      "createdTime": "26 jan 2019"
    });
    return true;
  }

  // ye sare entry kis tara see read kare ge
  Future<String> readAllNotes() async {
    final db = await intance.database;
    final orderBy =
        'createdTime ASC'; // yaha define kia k kis order me data show ho jaye
    final query_result = await db.query("NotestableNo1",orderBy: orderBy); // is orderby see ase order me data aye gi time k hisab see
    print(query_result);

    return "SUCCESFUL";
  }

// read specific node
  Future<String> readONeNote(int id) async {
    final db = await intance.database;
    final map = await db.query(
      "NotestableNo1",
      columns: ['title'],
      where: 'id=?',
      whereArgs: [id],
    );
    // print(map);
  }
}
