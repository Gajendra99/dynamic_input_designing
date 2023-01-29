// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class HomeController extends GetxController {
//   late Database database;
//   RxList<dynamic> item = [].obs;

//   @override
//   void onInit() async {
//     print("call onInit"); // this line not printing
//     await setupDB();
//     super.onInit();
//   }

//   Future<void> setupDB() async {
//     // Get a location using getDatabasesPath
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'demo.db');

// // open the database
//     database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       // When creating the db, create the table
//       await db.execute(
//           'CREATE TABLE IF NOT EXISTS Test (ID INTEGER PRIMARY KEY, TITLE TEXT,FIELDTYPE  INTEGER, MODELNAME TEXT)');
//     });

//     // Get the records
//     List<Map> list = await database.rawQuery('SELECT * FROM Test');

//     print(list);

// // Insert some records in a transaction
//     // await database!.transaction((txn) async {
//     //   int id1 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Circle", 1, "CIRCLE")');
//     //   int id2 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Area", 1, "AREA")');
//     //   int id3 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Distance from Lane", 0, "DISTANCE")');
//     //   int id4 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Seal Status", 1, "SEALSTATUS")');
//     //   int id5 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Tester Name", 0, "TESTERNAME")');
//     //   int id6 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Seal Status", 1, "SEALSTATUS")');
//     //   int id7 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Tester Name", 0, "TESTERNAME")');
//     //   int id8 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Name of GSS", 1, "GSS")');
//     //   int id9 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Earth Leckage", 0, "EARTHLECKAGE")');
//     //   int id10 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Is Faulty Meter", 1, "ISFAULTYMETER")');
//     //   int id11 = await txn.rawInsert(
//     //       'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Fault Type", 0, "FAULTTYPE")');
//     // });

// // Get the records
//   }

//   Future<List<Map>> getData() async {
//     List<Map<String, Object?>>? list =
//         await database.rawQuery('SELECT * FROM Test');
//     print("Printing list 2 : ${list.length}");
//     return list;
//   }
// }
