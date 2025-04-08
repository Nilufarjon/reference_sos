import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/commnon_componnent/text_sizer_comp/text_sizer_comp_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details_screen_model.dart';
export 'details_screen_model.dart';

class DetailsScreenWidget extends StatefulWidget {
  const DetailsScreenWidget({
    super.key,
    String? song,
    String? title,
    String? discription,
    required this.songTitle,
    required this.isVideo,
    this.videoPath,
  })  : this.song = song ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dummy-project-2y9hh5/assets/3rjtyxxo3gxp/19_-_%D0%9C%D0%B0%D0%BAS%D0%B8%D0%BC_-_%D0%9D%D0%B0%D1%83%D1%87%D1%83%D1%81%D1%8C_%D0%BB%D0%B5%D1%82%D0%B0%D1%82%D1%8C2121.mp3',
        this.title = title ?? 'Discription our theme about ecology',
        this.discription = discription ??
            'Praesent ut velit facilisis justo iaculis aliquet. Suspendisse potenti. Nunc maximus metus id convallis ullamcorper. Sed velit nisl, tincidunt sed egestas nec, gravida in augue. Aenean rutrum metus vitae erat aliquet pellentesque. Aliquam gravida nulla mi, eget volutpat dui accumsan nec. Vestibulum turpis odio, convallis sit amet sapien et, vehicula pretium leo. Nulla elementum sit amet tellus eu imperdiet. Vivamus mauris tortor, malesuada at turpis non, egestas rhoncus nisi. Pellentesque lobortis in lectus at euismod. Cras vulputate purus ac scelerisque malesuada. Aenean non risus eleifend, hendrerit eros nec, blandit erat. Aenean rhoncus vulputate metus, tempus volutpat tortor. Quisque condimentum est urna, ut porttitor massa euismod sed. Donec turpis lorem, scelerisque ac efficitur in, pretium placerat risus. Nam neque orci, imperdiet ut fringilla eu, tincidunt vel risus.';

  final String song;
  final String title;
  final String discription;
  final String? songTitle;
  final bool? isVideo;
  final String? videoPath;

  static String routeName = 'DetailsScreen';
  static String routePath = '/detailsScreen';

  @override
  State<DetailsScreenWidget> createState() => _DetailsScreenWidgetState();
}

class _DetailsScreenWidgetState extends State<DetailsScreenWidget> {
  late DetailsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsScreenModel());
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
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              ListView(
                padding: EdgeInsets.fromLTRB(
                  0,
                  0,
                  0,
                  24.0,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
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
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            // decoration: BoxDecoration(
                            //   shape: BoxShape.circle,
                            //   border: Border.all(
                            //     color: FlutterFlowTheme.of(context).primary,
                            //     width: 1.5,
                            //   ),
                            // ),
                            // alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Text(
                              widget!.title,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => InkWell(
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
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: TextSizerCompWidget(
                                        onTpOk: () async {
                                          Navigator.pop(context);
                                          FFAppState().textsize =
                                              FFAppState().textsize;
                                          FFAppState().update(() {});
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'dvabtmtr' /* Выбрать шрифт */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Text(
                                  FFAppState().textsize.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: custom_widgets.CustomSongPlayer(
                      width: double.infinity,
                      height: 150.0,
                      songTitle: widget!.songTitle,
                      songUrl: widget!.song,
                    ),
                  ),
                  if (widget!.isVideo == true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FlutterFlowVideoPlayer(
                        path: '${FFAppConstants.videoPath}${widget!.videoPath}',
                        videoType: VideoType.asset,
                        width: double.infinity,
                        height: 250.0,
                        autoPlay: false,
                        looping: true,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                  custom_widgets.HtmlConverter(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    text: widget!.discription,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x00F6F6F6), Color(0x8814181B)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
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