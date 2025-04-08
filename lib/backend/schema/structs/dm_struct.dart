// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DmStruct extends BaseStruct {
  DmStruct({
    int? id,
    String? imgs,
    String? title,
    Color? color,
  })  : _id = id,
        _imgs = imgs,
        _title = title,
        _color = color;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "imgs" field.
  String? _imgs;
  String get imgs => _imgs ?? '';
  set imgs(String? val) => _imgs = val;

  bool hasImgs() => _imgs != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static DmStruct fromMap(Map<String, dynamic> data) => DmStruct(
        id: castToType<int>(data['id']),
        imgs: data['imgs'] as String?,
        title: data['title'] as String?,
        color: getSchemaColor(data['color']),
      );

  static DmStruct? maybeFromMap(dynamic data) =>
      data is Map ? DmStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'imgs': _imgs,
        'title': _title,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'imgs': serializeParam(
          _imgs,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static DmStruct fromSerializableMap(Map<String, dynamic> data) => DmStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        imgs: deserializeParam(
          data['imgs'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'DmStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DmStruct &&
        id == other.id &&
        imgs == other.imgs &&
        title == other.title &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([id, imgs, title, color]);
}

DmStruct createDmStruct({
  int? id,
  String? imgs,
  String? title,
  Color? color,
}) =>
    DmStruct(
      id: id,
      imgs: imgs,
      title: title,
      color: color,
    );
