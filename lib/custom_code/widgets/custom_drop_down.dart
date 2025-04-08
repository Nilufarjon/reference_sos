// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: [
        DropdownMenuItem(
          value: "0",
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset(
                  '${FFAppState().imagpath}ru.png',
                  width: 45,
                  height: 32,
                ),
              ),
              Text(
                "Ru",
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      useGoogleFonts: false,
                      lineHeight: 1.5,
                    ),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: "1",
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset(
                  '${FFAppState().imagpath}tj.png',
                  width: 45,
                  height: 32,
                ),
              ),
              Text(
                "Tj",
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      useGoogleFonts: false,
                      lineHeight: 1.5,
                    ),
              ),
            ],
          ),
        ),
      ],
      onChanged: (value) {
        print('valueeeeeee--${value}');
        setState(() {
          // value = FFAppState().lanIndex;

          FFAppState().update(() {
            FFAppState().lanIndex = value.toString();
          });
        });
      },
      value: FFAppState().lanIndex,
    );
  }
}
