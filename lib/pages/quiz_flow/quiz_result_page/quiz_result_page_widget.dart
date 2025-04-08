import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_result_page_model.dart';
export 'quiz_result_page_model.dart';

class QuizResultPageWidget extends StatefulWidget {
  const QuizResultPageWidget({
    super.key,
    int? currectAns,
    int? totalQuestion,
  })  : this.currectAns = currectAns ?? 0,
        this.totalQuestion = totalQuestion ?? 0;

  final int currectAns;
  final int totalQuestion;

  static String routeName = 'QuizResultPage';
  static String routePath = '/quizResultPage';

  @override
  State<QuizResultPageWidget> createState() => _QuizResultPageWidgetState();
}

class _QuizResultPageWidgetState extends State<QuizResultPageWidget> {
  late QuizResultPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizResultPageModel());
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.ConfettiBgWidget(
                            width: double.infinity,
                            height: double.infinity,
                            loop: false,
                            particleCount: 40,
                            gravity: 30.0,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    FFAppState().lanIndex == '0'
                                        ? 'Ваш результат, можете еще раз пройти и улучшить. Тест завершен'
                                        : 'Натиҷа.Тест ба анҷом расид',
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  '${FFAppState().lanIndex == '0' ? 'Вы правильно ответили: ' : 'Шумо дуруст ҷавоб додед: '}${widget!.currectAns.toString()}${FFAppState().lanIndex == '0' ? ' из ' : ' аз '}${widget!.totalQuestion.toString()}',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.goNamed(HomePageWidget.routeName);
                              },
                              text: valueOrDefault<String>(
                                FFAppState().lanIndex == '0' ? 'Главная' : 'Асоси',
                                'Главная',
                              ),
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 16.0))
                            .addToEnd(SizedBox(height: 150.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
