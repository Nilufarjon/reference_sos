import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'demp_db',
      'stdemp.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<MainCatListRow>> mainCatList() => performMainCatList(
        _database,
      );

  Future<List<BookListRow>> bookList({
    int? prid,
  }) =>
      performBookList(
        _database,
        prid: prid,
      );

  Future<List<GetQuestionByIdRow>> getQuestionById({
    int? ids,
  }) =>
      performGetQuestionById(
        _database,
        ids: ids,
      );

  Future<List<GetAllQuestionsRow>> getAllQuestions() => performGetAllQuestions(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  /// END UPDATE QUERY CALLS
}
