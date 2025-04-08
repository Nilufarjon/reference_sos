// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/flutter_svg.dart';

class ImageCustom extends StatefulWidget {
  const ImageCustom({
    super.key,
    this.width,
    this.height,
    required this.imagename,
    this.topR,
    this.topL,
    this.bottomR,
    this.bottomL,
    this.fitIn,
    this.isSVG = false,
    this.isJPG = false,
    this.isPNG = false,
    this.isGIF = false,
  });

  final double? width;
  final double? height;
  final String imagename;
  final double? topR;
  final double? topL;
  final double? bottomR;
  final double? bottomL;
  final int? fitIn;
  final bool isSVG;
  final bool isJPG;
  final bool isPNG;
  final bool isGIF;

  @override
  State<ImageCustom> createState() => _ImageCustomState();
}

class _ImageCustomState extends State<ImageCustom> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(widget.topL ?? 0),
        topRight: Radius.circular(widget.topR ?? 0),
        bottomLeft: Radius.circular(widget.bottomL ?? 0),
        bottomRight: Radius.circular(widget.bottomR ?? 0),
      ),
      child: widget.isSVG
          ? SvgPicture.asset(
              'assets/images/${widget.imagename}',
              width: widget.width,
              height: widget.height,
              fit: widget.fitIn == 1 ? BoxFit.cover : BoxFit.contain,
            )
          : widget.isJPG
              ? Image.asset(
                  'assets/images/${widget.imagename}',
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fitIn == 1 ? BoxFit.cover : BoxFit.contain,
                )
              : widget.isPNG
                  ? Image.asset(
                      'assets/images/${widget.imagename}',
                      width: widget.width,
                      height: widget.height,
                      fit: widget.fitIn == 1 ? BoxFit.cover : BoxFit.contain,
                    )
                  : widget.isGIF
                      ? Image.asset(
                          'assets/images/${widget.imagename}.gif',
                          width: widget.width,
                          height: widget.height,
                          fit:
                              widget.fitIn == 1 ? BoxFit.cover : BoxFit.contain,
                        )
                      : const SizedBox(), // Fallback for unsupported types
    );
  }
}
