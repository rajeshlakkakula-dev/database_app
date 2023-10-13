
import 'dart:async';
import 'package:database_app/Employees.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {

  // Errors caused by Flutter Upgrade
  WidgetsFlutterBinding.ensureInitialized();

  // Open Database and store the references.
  final database = openDatabase(

      // Set the path to database
      /**
     *  The 'join' function is the best way/ good practice
     *  to implement the path correctly
     * */
      join(await getDatabasesPath(), 'emp_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE employees(id INTEGER PRIMARY KEY,name TEXT , email TEXT)',
        );
      },
    version: 1
  );


  Future<void> insertEmployee(Employees employees) async {
    // Get a reference to the database
    final db = await database;

    // 'conflictAlgorithm - To use incase the same employee is inserted twice , TO replace any previous data'
    await db.insert('employees', employees.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  var venkatesh =
      Employees(id: 01, name: 'Venkatesh', email: 'venkatesh@gmail.com');

  await insertEmployee(venkatesh);
}
