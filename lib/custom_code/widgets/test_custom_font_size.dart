// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:wheel_chooser/wheel_chooser.dart';

class TestCustomFontSize extends StatefulWidget {
  const TestCustomFontSize({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<TestCustomFontSize> createState() => _TestCustomFontSizeState();
}

class _TestCustomFontSizeState extends State<TestCustomFontSize> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: WheelChooser.integer(
        onValueChanged: (value) {
          FFAppState().update(() {
            FFAppState().textsize = value;
          });
        },
        initValue: FFAppState().textsize,
        maxValue: 24, minValue: 14,
        // step: 2,
        selectTextStyle: TextStyle(
          color: Color(0xff00BBD4),
          fontSize: 20,
        ),
        unSelectTextStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
    );
  }
}
