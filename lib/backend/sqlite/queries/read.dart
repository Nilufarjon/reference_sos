import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN MAINCATLIST
Future<List<MainCatListRow>> performMainCatList(
  Database database,
) {
  final query = '''
SELECT * FROM catTable;
''';
  return _readQuery(database, query, (d) => MainCatListRow(d));
}

class MainCatListRow extends SqliteRow {
  MainCatListRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get image => data['image'] as String;
  String get titleRu => data['title_ru'] as String;
  String get titleTj => data['title_tj'] as String;
  String get bookTitleRu => data['book_title_ru'] as String;
  String get bookTitleTj => data['book_title_tj'] as String;
  String get bookImg => data['book_img'] as String;
  String get songUrlRu => data['song_url_ru'] as String;
  String get songUrlTj => data['song_url_tj'] as String;
  String get songTitleRu => data['song_title_ru'] as String;
  String get songTitleTj => data['song_title_tj'] as String;
  String get discriptionRu => data['discription_ru'] as String;
  String get discriptionTj => data['discription_tj'] as String;
}

/// END MAINCATLIST

/// BEGIN BOOKLIST
Future<List<BookListRow>> performBookList(
  Database database, {
  int? prid,
}) {
  final query = '''
SELECT * FROM book_detils WHERE pr_id = ${prid};
''';
  return _readQuery(database, query, (d) => BookListRow(d));
}

class BookListRow extends SqliteRow {
  BookListRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  int get prId => data['pr_id'] as int;
  String get bookTitleRu => data['book_title_ru'] as String;
  String get bookTitleTj => data['book_title_tj'] as String;
  String get bookImg => data['book_img'] as String;
  String get songTitleRu => data['song_title_ru'] as String;
  String get songTitleTj => data['song_title_tj'] as String;
  String get discriptionRu => data['discription_ru'] as String;
  String get discriptionTj => data['discription_tj'] as String;
  String get songUrlRu => data['song_url_ru'] as String;
  String get songUrlTj => data['song_url_tj'] as String;
  String get image => data['image'] as String;
  String get titleRu => data['title_ru'] as String;
  String get titleTj => data['title_tj'] as String;
  String get isVideo => data['isVideo'] as String;
  String get videoPath => data['video_path'] as String;
}

/// END BOOKLIST

/// BEGIN GETQUESTIONBYID
Future<List<GetQuestionByIdRow>> performGetQuestionById(
  Database database, {
  int? ids,
}) {
  final query = '''
SELECT * FROM quiz_table  WHERE  id = ${ids};
''';
  return _readQuery(database, query, (d) => GetQuestionByIdRow(d));
}

class GetQuestionByIdRow extends SqliteRow {
  GetQuestionByIdRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get questionRu => data['question_ru'] as String;
  String get questionTj => data['question_tj'] as String;
  String get optionRuA => data['option_ru_a'] as String;
  String get optionRuB => data['option_ru_b'] as String;
  String get optionRuC => data['option_ru_c'] as String;
  String get optionRuD => data['option_ru_d'] as String;
  String get optionTjA => data['option_tj_a'] as String;
  String get optionTjB => data['option_tj_b'] as String;
  String get optionTjC => data['option_tj_c'] as String;
  String get optionTjD => data['option_tj_d'] as String;
  String get answerRu => data['answer_ru'] as String;
  String get answerTj => data['answer_tj'] as String;
  int get isComplate => data['isComplate'] as int;
}

/// END GETQUESTIONBYID

/// BEGIN GETALLQUESTIONS
Future<List<GetAllQuestionsRow>> performGetAllQuestions(
  Database database,
) {
  final query = '''
SELECT * FROM quiz_table  ;
''';
  return _readQuery(database, query, (d) => GetAllQuestionsRow(d));
}

class GetAllQuestionsRow extends SqliteRow {
  GetAllQuestionsRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get questionRu => data['question_ru'] as String;
  String get questionTj => data['question_tj'] as String;
  String get optionRuA => data['option_ru_a'] as String;
  String get optionRuB => data['option_ru_b'] as String;
  String get optionRuC => data['option_ru_c'] as String;
  String get optionRuD => data['option_ru_d'] as String;
  String get optionTjA => data['option_tj_a'] as String;
  String get optionTjB => data['option_tj_b'] as String;
  String get optionTjC => data['option_tj_c'] as String;
  String get optionTjD => data['option_tj_d'] as String;
  String get answerRu => data['answer_ru'] as String;
  String get answerTj => data['answer_tj'] as String;
  int get isComplate => data['isComplate'] as int;
}

/// END GETALLQUESTIONS
