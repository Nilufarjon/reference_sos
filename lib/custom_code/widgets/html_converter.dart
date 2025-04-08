// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:html/dom.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlConverter extends StatefulWidget {
  const HtmlConverter({
    super.key,
    this.width,
    this.height,
    required this.text,
  });

  final double? width;
  final double? height;
  final String text;

  @override
  State<HtmlConverter> createState() => _HtmlConverterState();
}

class _HtmlConverterState extends State<HtmlConverter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: HtmlWidget(
            // the first parameter (`html`) is required
            //         '''
            // <h3>Heading</h3>
            // <p>
            //   A paragraph with <strong>strong</strong>, <em>emphasized</em>
            //   and <span style="color: red">colored</span> text.
            // </p>
            // ''',

            widget.text.replaceAll("&quot;", '"'),

            // all other parameters are optional, a few notable params:

            // specify custom styling for an element
            // see supported inline styling below

            // select the render mode for HTML body
            // by default, a simple `Column` is rendered
            // consider using `ListView` or `SliverList` for better performance
            renderMode: RenderMode.column,

            // set the default styling for text
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: FFAppState().textsize.toDouble(),
                ),
          ),
        ),
      ],
    );
  }
}
