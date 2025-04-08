import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/commnon_componnent/call_action_comp/call_action_comp_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'books_screen_model.dart';
export 'books_screen_model.dart';

class BooksScreenWidget extends StatefulWidget {
  const BooksScreenWidget({
    super.key,
    int? prId,
  }) : this.prId = prId ?? 1;

  final int prId;

  static String routeName = 'BooksScreen';
  static String routePath = '/booksScreen';

  @override
  State<BooksScreenWidget> createState() => _BooksScreenWidgetState();
}

class _BooksScreenWidgetState extends State<BooksScreenWidget> {
  late BooksScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BooksScreenModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
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
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      FutureBuilder<List<BookListRow>>(
                        future: SQLiteManager.instance.bookList(
                          prid: widget!.prId,
                        ),
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
                          final listViewBookListRowList = snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              24.0,
                              0,
                              24.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: listViewBookListRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 16.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewBookListRow =
                                  listViewBookListRowList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      DetailsScreenWidget.routeName,
                                      queryParameters: {
                                        'song': serializeParam(
                                          FFAppState().lanIndex == '0'
                                              ? '${FFAppState().audioPath}${listViewBookListRow.songUrlRu}'
                                              : '${FFAppState().audioPath}${listViewBookListRow.songUrlTj}',
                                          ParamType.String,
                                        ),
                                        'title': serializeParam(
                                          FFAppState().lanIndex == '0'
                                              ? listViewBookListRow.bookTitleRu
                                              : listViewBookListRow.bookTitleTj,
                                          ParamType.String,
                                        ),
                                        'discription': serializeParam(
                                          FFAppState().lanIndex == '0'
                                              ? listViewBookListRow
                                                  .discriptionRu
                                              : listViewBookListRow
                                                  .discriptionTj,
                                          ParamType.String,
                                        ),
                                        'songTitle': serializeParam(
                                          FFAppState().lanIndex == '0'
                                              ? listViewBookListRow.songTitleRu
                                              : listViewBookListRow.songTitleTj,
                                          ParamType.String,
                                        ),
                                        'isVideo': serializeParam(
                                          '1' == listViewBookListRow.isVideo
                                              ? true
                                              : false,
                                          ParamType.bool,
                                        ),
                                        'videoPath': serializeParam(
                                          listViewBookListRow.videoPath,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0.5,
                                          color: Color(0x2157636C),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 20.0, 24.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 80.0,
                                            height: 80.0,
                                            child: custom_widgets.ImageCustom(
                                              width: 80.0,
                                              height: 80.0,
                                              imagename:
                                                  listViewBookListRow.image,
                                              topR: 0.0,
                                              topL: 0.0,
                                              bottomR: 0.0,
                                              bottomL: 0.0,
                                              fitIn: 0,
                                              isSVG: false,
                                              isJPG: true,
                                              isPNG: false,
                                              isGIF: false,
                                            ),
                                          ),
                                          Expanded(
                                            child: Builder(
                                              builder: (context) {
                                                if (FFAppState().lanIndex ==
                                                    '0') {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewBookListRow
                                                          .titleRu,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 17.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewBookListRow
                                                          .titleTj,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 17.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: CallActionCompWidget(),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 56.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'fljhzox5' /* 112 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
