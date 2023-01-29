import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:serial_connection/custom_user_dropdown.dart';
import 'package:serial_connection/custom_user_input.dart';
import 'package:serial_connection/homeController.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

// @override
// void initState() async {
//   HomeController controller = Get.find();
//   await controller.setupDB();
// }

class MyApp extends StatelessWidget {
  late Database database;

  Future<List<Map>> setupDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

// open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE IF NOT EXISTS Test (ID INTEGER PRIMARY KEY, TITLE TEXT,FIELDTYPE  INTEGER, MODELNAME TEXT)');
    });

    // Get the records
    List<Map> list = await database.rawQuery('SELECT * FROM Test');

    if (list.length == 0) {
      await database.transaction((txn) async {
        int id1 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Circle", 1, "CIRCLE")');
        int id2 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Area", 1, "AREA")');
        int id3 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Distance from Lane", 0, "DISTANCE")');
        int id4 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Seal Status", 1, "SEALSTATUS")');
        int id5 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Tester Name", 0, "TESTERNAME")');
        int id6 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Seal Status", 1, "SEALSTATUS")');
        int id7 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Tester Name", 0, "TESTERNAME")');
        int id8 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Name of GSS", 1, "GSS")');
        int id9 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Earth Leckage", 0, "EARTHLECKAGE")');
        int id10 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Is Faulty Meter", 1, "ISFAULTYMETER")');
        int id11 = await txn.rawInsert(
            'INSERT INTO Test(TITLE, FIELDTYPE, MODELNAME) VALUES("Fault Type", 0, "FAULTTYPE")');
      });
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // HomeController controller = Get.put(HomeController());

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: Get.width,
              height: Get.height,
              child: FutureBuilder(
                  future: setupDB(),
                  builder: ((BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data[index]['FIELDTYPE'] == 1) {
                              return CustomUserInput(
                                id: snapshot.data[index]['ID'],
                                title: snapshot.data[index]['TITLE'],
                                hintText: snapshot.data[index]['TITLE'],
                              );
                            } else {
                              return CustomUserDropDown(
                                id: snapshot.data[index]['ID'],
                                title: snapshot.data[index]['TITLE'],
                              );
                            }
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  })),
            ),
          ),
        ),
      ),
    );
  }
}
