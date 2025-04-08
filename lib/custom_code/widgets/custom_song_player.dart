// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:audioplayers/audioplayers.dart';

class CustomSongPlayer extends StatefulWidget {
  const CustomSongPlayer({
    super.key,
    this.width,
    this.height,
    this.songTitle,
    this.songUrl,
  });

  final double? width;
  final double? height;
  final String? songTitle;
  final String? songUrl;

  @override
  State<CustomSongPlayer> createState() => _CustomSongPlayerState();
}

class _CustomSongPlayerState extends State<CustomSongPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Listen for changes in position and duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        _duration = newDuration;
      });
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        _position = newPosition;
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        _position = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _toggleAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('${widget.songUrl}'));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _seekAudio(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.songTitle}',
                style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Theme(
                  data: ThemeData(
                    sliderTheme: const SliderThemeData(
                      trackHeight: 3.5,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 0,
                      ),
                    ),
                  ),
                  child: Slider(
                    // label: "${_position.inMinutes}:${_position.inSeconds.remainder(60).toString().padLeft(2, '0')}",,
                    thumbColor: FlutterFlowTheme.of(context).primary,
                    secondaryActiveColor: Colors.blue,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    value: _position.inSeconds
                        .toDouble()
                        .clamp(0.0, _duration.inSeconds.toDouble()),
                    onChanged: (value) => _seekAudio(value),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_position.inMinutes}:${_position.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                    style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    "${_duration.inMinutes}:${_duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                    style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                  )
                ],
              ),
            ],
          )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                shape: CircleBorder(),
                backgroundColor: FlutterFlowTheme.of(context).primary),
            onPressed: _toggleAudio,
            child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
