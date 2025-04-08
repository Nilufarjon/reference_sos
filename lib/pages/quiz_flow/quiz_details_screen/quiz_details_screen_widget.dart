import '';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_details_screen_model.dart';
export 'quiz_details_screen_model.dart';

class QuizDetailsScreenWidget extends StatefulWidget {
  const QuizDetailsScreenWidget({super.key});

  static String routeName = 'QuizDetailsScreen';
  static String routePath = '/quizDetailsScreen';

  @override
  State<QuizDetailsScreenWidget> createState() =>
      _QuizDetailsScreenWidgetState();
}

class _QuizDetailsScreenWidgetState extends State<QuizDetailsScreenWidget> {
  late QuizDetailsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizDetailsScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<GetAllQuestionsRow>>(
            future: SQLiteManager.instance.getAllQuestions(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final containerGetAllQuestionsRowList = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                               // decoration: BoxDecoration(
                                 // shape: BoxShape.circle,
                                 // border: Border.all(
                                   // color: FlutterFlowTheme.of(context).primary,
                                   // width: 1.5,
                                 // ),
                               // ),
                               // alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Text(
                                  '${_model.qnId.toString()}${FFAppState().lanIndex == '0' ? ' из ' : ' аз '}${containerGetAllQuestionsRowList.length.toString()}${FFAppState().lanIndex == '0' ? ' вопросы' : ' саволҳо'}',
                                  maxLines: 3,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            FutureBuilder<List<GetQuestionByIdRow>>(
                              future: SQLiteManager.instance.getQuestionById(
                                ids: _model.qnId,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final containerGetQuestionByIdRowList =
                                    snapshot.data!;

                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          FFAppState().lanIndex ==
                                                                  '0'
                                                              ? containerGetQuestionByIdRowList
                                                                  .firstOrNull
                                                                  ?.questionRu
                                                              : containerGetQuestionByIdRowList
                                                                  .firstOrNull
                                                                  ?.questionTj,
                                                          'Title',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 7,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (_model.qAnswer ==
                                                              null ||
                                                          _model.qAnswer ==
                                                              '') {
                                                        _model
                                                            .qAnswer = FFAppState()
                                                                    .lanIndex ==
                                                                '0'
                                                            ? containerGetQuestionByIdRowList
                                                                .firstOrNull
                                                                ?.optionRuA
                                                            : containerGetQuestionByIdRowList
                                                                .firstOrNull
                                                                ?.optionTjA;
                                                        _model.selectedIndex =
                                                            1;
                                                        safeSetState(() {});
                                                        if (_model.qAnswer ==
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState().lanIndex ==
                                                                      '0'
                                                                  ? containerGetQuestionByIdRowList
                                                                      .firstOrNull
                                                                      ?.answerRu
                                                                  : containerGetQuestionByIdRowList
                                                                      .firstOrNull
                                                                      ?.answerTj,
                                                              'Option',
                                                            )) {
                                                          _model.answerIndex =
                                                              1;
                                                          _model.totalRightAnswer =
                                                              _model.totalRightAnswer! +
                                                                  1;
                                                          safeSetState(() {});
                                                        } else {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          _model.wrongIndex = 1;
                                                          _model.totalWrongAnswer =
                                                              _model.totalWrongAnswer! +
                                                                  1;
                                                          safeSetState(() {});
                                                          if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuA
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjA,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                1;
                                                            safeSetState(() {});
                                                          } else if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuB
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjB,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                2;
                                                            safeSetState(() {});
                                                          } else if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuC
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjC,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                3;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.answerIndex =
                                                                4;
                                                            safeSetState(() {});
                                                          }
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Ответ уже выбран',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 56.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if (_model
                                                                    .answerIndex ==
                                                                1) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .success;
                                                            } else if (_model
                                                                    .wrongIndex ==
                                                                1) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .error;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground;
                                                            }
                                                          }(),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState().lanIndex ==
                                                                    '0'
                                                                ? containerGetQuestionByIdRowList
                                                                    .firstOrNull
                                                                    ?.optionRuA
                                                                : containerGetQuestionByIdRowList
                                                                    .firstOrNull
                                                                    ?.optionTjA,
                                                            'Option',
                                                          ),
                                                          maxLines: 4,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (_model.qAnswer ==
                                                              null ||
                                                          _model.qAnswer ==
                                                              '') {
                                                        _model
                                                            .qAnswer = FFAppState()
                                                                    .lanIndex ==
                                                                '0'
                                                            ? containerGetQuestionByIdRowList
                                                                .firstOrNull
                                                                ?.optionRuB
                                                            : containerGetQuestionByIdRowList
                                                                .firstOrNull
                                                                ?.optionTjB;
                                                        _model.selectedIndex =
                                                            2;
                                                        safeSetState(() {});
                                                        if (_model.qAnswer ==
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState().lanIndex ==
                                                                      '0'
                                                                  ? containerGetQuestionByIdRowList
                                                                      .firstOrNull
                                                                      ?.answerRu
                                                                  : containerGetQuestionByIdRowList
                                                                      .firstOrNull
                                                                      ?.answerTj,
                                                              'Option',
                                                            )) {
                                                          _model.answerIndex =
                                                              2;
                                                          _model.totalRightAnswer =
                                                              _model.totalRightAnswer! +
                                                                  1;
                                                          safeSetState(() {});
                                                        } else {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          _model.wrongIndex = 2;
                                                          _model.totalWrongAnswer =
                                                              _model.totalWrongAnswer! +
                                                                  1;
                                                          safeSetState(() {});
                                                          if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuA
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjA,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                1;
                                                            safeSetState(() {});
                                                          } else if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuB
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjB,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                2;
                                                            safeSetState(() {});
                                                          } else if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuC
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjC,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                3;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.answerIndex =
                                                                4;
                                                            safeSetState(() {});
                                                          }
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Ответ уже выбран',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 56.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if (_model
                                                                    .answerIndex ==
                                                                2) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .success;
                                                            } else if (_model
                                                                    .wrongIndex ==
                                                                2) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .error;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground;
                                                            }
                                                          }(),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState().lanIndex ==
                                                                    '0'
                                                                ? containerGetQuestionByIdRowList
                                                                    .firstOrNull
                                                                    ?.optionRuB
                                                                : containerGetQuestionByIdRowList
                                                                    .firstOrNull
                                                                    ?.optionTjB,
                                                            'Option',
                                                          ),
                                                          maxLines: 4,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (_model.qAnswer ==
                                                              null ||
                                                          _model.qAnswer ==
                                                              '') {
                                                        _model
                                                            .qAnswer = FFAppState()
                                                                    .lanIndex ==
                                                                '0'
                                                            ? containerGetQuestionByIdRowList
                                                                .firstOrNull
                                                                ?.optionRuC
                                                            : containerGetQuestionByIdRowList
                                                                .firstOrNull
                                                                ?.optionTjC;
                                                        _model.selectedIndex =
                                                            3;
                                                        safeSetState(() {});
                                                        if (_model.qAnswer ==
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState().lanIndex ==
                                                                      '0'
                                                                  ? containerGetQuestionByIdRowList
                                                                      .firstOrNull
                                                                      ?.answerRu
                                                                  : containerGetQuestionByIdRowList
                                                                      .firstOrNull
                                                                      ?.answerTj,
                                                              'Option',
                                                            )) {
                                                          _model.answerIndex =
                                                              3;
                                                          _model.totalRightAnswer =
                                                              _model.totalRightAnswer! +
                                                                  1;
                                                          safeSetState(() {});
                                                        } else {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          _model.wrongIndex = 3;
                                                          _model.totalWrongAnswer =
                                                              _model.totalWrongAnswer! +
                                                                  1;
                                                          safeSetState(() {});
                                                          if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuA
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjA,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                1;
                                                            safeSetState(() {});
                                                          } else if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuB
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjB,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                2;
                                                            safeSetState(() {});
                                                          } else if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuC
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjC,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                3;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.answerIndex =
                                                                4;
                                                            safeSetState(() {});
                                                          }
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Answer Already Selected',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 56.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if (_model
                                                                    .answerIndex ==
                                                                3) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .success;
                                                            } else if (_model
                                                                    .wrongIndex ==
                                                                3) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .error;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground;
                                                            }
                                                          }(),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState().lanIndex ==
                                                                    '0'
                                                                ? containerGetQuestionByIdRowList
                                                                    .firstOrNull
                                                                    ?.optionRuC
                                                                : containerGetQuestionByIdRowList
                                                                    .firstOrNull
                                                                    ?.optionTjC,
                                                            'Option',
                                                          ),
                                                          maxLines: 4,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (_model.qAnswer ==
                                                              null ||
                                                          _model.qAnswer ==
                                                              '') {
                                                        _model
                                                            .qAnswer = FFAppState()
                                                                    .lanIndex ==
                                                                '0'
                                                            ? containerGetQuestionByIdRowList
                                                                .firstOrNull
                                                                ?.optionRuD
                                                            : containerGetQuestionByIdRowList
                                                                .firstOrNull
                                                                ?.optionTjD;
                                                        _model.selectedIndex =
                                                            4;
                                                        safeSetState(() {});
                                                        if (_model.qAnswer ==
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState().lanIndex ==
                                                                      '0'
                                                                  ? containerGetQuestionByIdRowList
                                                                      .firstOrNull
                                                                      ?.answerRu
                                                                  : containerGetQuestionByIdRowList
                                                                      .firstOrNull
                                                                      ?.answerTj,
                                                              'Option',
                                                            )) {
                                                          _model.answerIndex =
                                                              4;
                                                          _model.totalRightAnswer =
                                                              _model.totalRightAnswer! +
                                                                  1;
                                                          safeSetState(() {});
                                                        } else {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          _model.wrongIndex = 4;
                                                          _model.totalWrongAnswer =
                                                              _model.totalWrongAnswer! +
                                                                  1;
                                                          safeSetState(() {});
                                                          if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuA
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjA,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                1;
                                                            safeSetState(() {});
                                                          } else if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuB
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjB,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                2;
                                                            safeSetState(() {});
                                                          } else if (valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionRuC
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.optionTjC,
                                                                'Option',
                                                              ) ==
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().lanIndex ==
                                                                        '0'
                                                                    ? containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerRu
                                                                    : containerGetQuestionByIdRowList
                                                                        .firstOrNull
                                                                        ?.answerTj,
                                                                'Option',
                                                              )) {
                                                            _model.answerIndex =
                                                                3;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.answerIndex =
                                                                4;
                                                            safeSetState(() {});
                                                          }
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Answer Already Selected',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 56.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if (_model
                                                                    .answerIndex ==
                                                                4) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .success;
                                                            } else if (_model
                                                                    .wrongIndex ==
                                                                4) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .error;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground;
                                                            }
                                                          }(),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState().lanIndex ==
                                                                    '0'
                                                                ? containerGetQuestionByIdRowList
                                                                    .firstOrNull
                                                                    ?.optionRuD
                                                                : containerGetQuestionByIdRowList
                                                                    .firstOrNull
                                                                    ?.optionTjD,
                                                            'Option',
                                                          ),
                                                          maxLines: 4,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 16.0))
                                                  .addToStart(
                                                      SizedBox(height: 24.0))
                                                  .addToEnd(
                                                      SizedBox(height: 16.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.qnId ==
                                                    containerGetAllQuestionsRowList
                                                        .length) {
                                                  context.pushNamed(
                                                    QuizResultPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'currectAns':
                                                          serializeParam(
                                                        _model.totalRightAnswer,
                                                        ParamType.int,
                                                      ),
                                                      'totalQuestion':
                                                          serializeParam(
                                                        containerGetAllQuestionsRowList
                                                            .length,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (_model.qAnswer == null ||
                                                      _model.qAnswer == '') {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'first complate this question...',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                    HapticFeedback
                                                        .heavyImpact();
                                                  } else {
                                                    _model.qnId =
                                                        _model.qnId + 1;
                                                    _model.qAnswer = null;
                                                    _model.selectedIndex = null;
                                                    _model.answerIndex = null;
                                                    _model.wrongIndex = null;
                                                    safeSetState(() {});

                                                    safeSetState(() {});
                                                  }
                                                }
                                              },
                                              child: Container(
                                                width: 150.0,
                                                height: 56.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'm9p55m8o' /* Next  */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Roboto',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .addToStart(SizedBox(width: 20.0))
                                              .addToEnd(SizedBox(width: 20.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
