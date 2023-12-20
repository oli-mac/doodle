import 'package:doodle/common/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DbHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        date STRING,
        startTime STRING,
        endTime STRING,
        reminder INTEGER,
        repeat STRING,
        isCompleted INTEGER
      )

      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0,
        name TEXT,
        email TEXT,
        password TEXT,
        phone TEXT,
        isVerified INTEGER
      )
    ''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'todo.db',
      version: 1,
      onCreate: (sql.Database database, version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItems(TaskModel task) async {
    final db = await DbHelper.db();

    final id = await db.insert('todo', task.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<int> createUsers(int isVerified) async {
    final db = await DbHelper.db();

    final data = {
      'id': 1,
      'name': 'name',
      'email': 'email',
      'password': 'password',
      'phone': 'phone',
      'isVerified': isVerified
    };

    final id = await db.insert('user', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await DbHelper.db();

    return db.query('user', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DbHelper.db();

    return db.query('todo', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DbHelper.db();

    return db.query('todo', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItems(TaskModel task) async {
    final db = await DbHelper.db();

    final id = await db
        .update('todo', task.toJson(), where: 'id = ?', whereArgs: [task.id]);

    return id;
  }

  static Future<int> deleteItems(int id) async {
    final db = await DbHelper.db();

    final count = await db.delete('todo', where: 'id = ?', whereArgs: [id]);

    return count;
  }

  //!to do when we start profile edit
  // static Future<int> updateUsers(int isVerified) async {
  //   final db = await DbHelper.db();

  //   final data = {
  //     'id': 1,
  //     'name': 'name',
  //     'email': 'email',
  //     'password': 'password',
  //     'phone': 'phone',
  //     'isVerified': isVerified
  //   };

  //   final id = await db.update('user', data, where: 'id = ?', whereArgs: [1]);

  //   return id;
  // }
}
