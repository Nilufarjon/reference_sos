import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _iddarkmode = prefs.getBool('ff_iddarkmode') ?? _iddarkmode;
    });
    _safeInit(() {
      _imagpath = prefs.getString('ff_imagpath') ?? _imagpath;
    });
    _safeInit(() {
      _audioPath = prefs.getString('ff_audioPath') ?? _audioPath;
    });
    _safeInit(() {
      _fontSize = prefs.getDouble('ff_fontSize') ?? _fontSize;
    });
    _safeInit(() {
      _lanIndex = prefs.getString('ff_lanIndex') ?? _lanIndex;
    });
    _safeInit(() {
      _textsize = prefs.getInt('ff_textsize') ?? _textsize;
    });
    _safeInit(() {
      _IsDarkMode = prefs.getBool('ff_IsDarkMode') ?? _IsDarkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _iddarkmode = false;
  bool get iddarkmode => _iddarkmode;
  set iddarkmode(bool value) {
    _iddarkmode = value;
    prefs.setBool('ff_iddarkmode', value);
  }

  String _imagpath = 'assets/images/';
  String get imagpath => _imagpath;
  set imagpath(String value) {
    _imagpath = value;
    prefs.setString('ff_imagpath', value);
  }

  String _audioPath = 'audios/';
  String get audioPath => _audioPath;
  set audioPath(String value) {
    _audioPath = value;
    prefs.setString('ff_audioPath', value);
  }

  double _fontSize = 17.0;
  double get fontSize => _fontSize;
  set fontSize(double value) {
    _fontSize = value;
    prefs.setDouble('ff_fontSize', value);
  }

  String _lanIndex = '0';
  String get lanIndex => _lanIndex;
  set lanIndex(String value) {
    _lanIndex = value;
    prefs.setString('ff_lanIndex', value);
  }

  int _textsize = 14;
  int get textsize => _textsize;
  set textsize(int value) {
    _textsize = value;
    prefs.setInt('ff_textsize', value);
  }

  bool _IsDarkMode = false;
  bool get IsDarkMode => _IsDarkMode;
  set IsDarkMode(bool value) {
    _IsDarkMode = value;
    prefs.setBool('ff_IsDarkMode', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
