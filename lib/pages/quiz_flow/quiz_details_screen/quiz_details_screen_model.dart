import '';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'quiz_details_screen_widget.dart' show QuizDetailsScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizDetailsScreenModel extends FlutterFlowModel<QuizDetailsScreenWidget> {
  ///  Local state fields for this page.

  int qnId = 1;

  String? qAnswer;

  int? selectedIndex;

  int? answerIndex;

  int? wrongIndex;

  int? totalRightAnswer = 0;

  int? totalWrongAnswer = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
