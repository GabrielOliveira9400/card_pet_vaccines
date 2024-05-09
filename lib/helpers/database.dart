
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    print(await getDatabasesPath());
    return await openDatabase(
      join(await getDatabasesPath(), 'card_pet_vaccines.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(_pets);
    await db.execute(_vaccines);
    await db.execute(_notifications);
    await db.execute(_users);

  }

  final String _pets = '''
    CREATE TABLE "pets" (
	"id"	INTEGER,
	"userId"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"type"	TEXT NOT NULL,
	"breed"	TEXT NOT NULL,
	"birthDate"	TEXT NOT NULL,
	"gender"	TEXT,
	"weight"	TEXT,
	"description"	TEXT,
	"picture"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("userId") REFERENCES "users"("id")
);
  ''';

  final String _vaccines = '''
    CREATE TABLE "vaccines" (
  "id"	INTEGER,
  "petId"	INTEGER NOT NULL,
  "name"	TEXT NOT NULL,
  "date"	TEXT NOT NULL,
  "description"	TEXT,
  "validade"	INTEGER,
  PRIMARY KEY("id" AUTOINCREMENT),
  FOREIGN KEY("petId") REFERENCES "pets"("id")
);
  ''';

  final String _notifications = '''
    CREATE TABLE "notifications" (
  "id"	INTEGER,
  "userId"	INTEGER NOT NULL,
  "title"	TEXT NOT NULL,
  "message"	TEXT NOT NULL,
  "date"	TEXT NOT NULL,
  "read"	INTEGER NOT NULL,
  PRIMARY KEY("id" AUTOINCREMENT),
  FOREIGN KEY("userId") REFERENCES "users"("id")
);
  ''';

  final String _users = '''
    CREATE TABLE "users" (
  "id"	INTEGER,
  "name"	TEXT NOT NULL,
  "email"	TEXT NOT NULL,
  "password"	TEXT NOT NULL,
  PRIMARY KEY("id" AUTOINCREMENT)
);
  ''';

}
