import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'quiz_result_page_widget.dart' show QuizResultPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizResultPageModel extends FlutterFlowModel<QuizResultPageWidget> {
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
