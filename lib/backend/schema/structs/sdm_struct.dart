// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SdmStruct extends BaseStruct {
  SdmStruct({
    int? prId,
    int? id,
    String? sdImgs,
    String? title,
    String? songUrl,
    String? songTitle,
    String? discription,
  })  : _prId = prId,
        _id = id,
        _sdImgs = sdImgs,
        _title = title,
        _songUrl = songUrl,
        _songTitle = songTitle,
        _discription = discription;

  // "pr_id" field.
  int? _prId;
  int get prId => _prId ?? 0;
  set prId(int? val) => _prId = val;

  void incrementPrId(int amount) => prId = prId + amount;

  bool hasPrId() => _prId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "sd_imgs" field.
  String? _sdImgs;
  String get sdImgs => _sdImgs ?? '';
  set sdImgs(String? val) => _sdImgs = val;

  bool hasSdImgs() => _sdImgs != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "song_url" field.
  String? _songUrl;
  String get songUrl => _songUrl ?? '';
  set songUrl(String? val) => _songUrl = val;

  bool hasSongUrl() => _songUrl != null;

  // "song_title" field.
  String? _songTitle;
  String get songTitle => _songTitle ?? '';
  set songTitle(String? val) => _songTitle = val;

  bool hasSongTitle() => _songTitle != null;

  // "discription" field.
  String? _discription;
  String get discription => _discription ?? '';
  set discription(String? val) => _discription = val;

  bool hasDiscription() => _discription != null;

  static SdmStruct fromMap(Map<String, dynamic> data) => SdmStruct(
        prId: castToType<int>(data['pr_id']),
        id: castToType<int>(data['id']),
        sdImgs: data['sd_imgs'] as String?,
        title: data['title'] as String?,
        songUrl: data['song_url'] as String?,
        songTitle: data['song_title'] as String?,
        discription: data['discription'] as String?,
      );

  static SdmStruct? maybeFromMap(dynamic data) =>
      data is Map ? SdmStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pr_id': _prId,
        'id': _id,
        'sd_imgs': _sdImgs,
        'title': _title,
        'song_url': _songUrl,
        'song_title': _songTitle,
        'discription': _discription,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pr_id': serializeParam(
          _prId,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'sd_imgs': serializeParam(
          _sdImgs,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'song_url': serializeParam(
          _songUrl,
          ParamType.String,
        ),
        'song_title': serializeParam(
          _songTitle,
          ParamType.String,
        ),
        'discription': serializeParam(
          _discription,
          ParamType.String,
        ),
      }.withoutNulls;

  static SdmStruct fromSerializableMap(Map<String, dynamic> data) => SdmStruct(
        prId: deserializeParam(
          data['pr_id'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        sdImgs: deserializeParam(
          data['sd_imgs'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        songUrl: deserializeParam(
          data['song_url'],
          ParamType.String,
          false,
        ),
        songTitle: deserializeParam(
          data['song_title'],
          ParamType.String,
          false,
        ),
        discription: deserializeParam(
          data['discription'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SdmStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SdmStruct &&
        prId == other.prId &&
        id == other.id &&
        sdImgs == other.sdImgs &&
        title == other.title &&
        songUrl == other.songUrl &&
        songTitle == other.songTitle &&
        discription == other.discription;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([prId, id, sdImgs, title, songUrl, songTitle, discription]);
}

SdmStruct createSdmStruct({
  int? prId,
  int? id,
  String? sdImgs,
  String? title,
  String? songUrl,
  String? songTitle,
  String? discription,
}) =>
    SdmStruct(
      prId: prId,
      id: id,
      sdImgs: sdImgs,
      title: title,
      songUrl: songUrl,
      songTitle: songTitle,
      discription: discription,
    );
