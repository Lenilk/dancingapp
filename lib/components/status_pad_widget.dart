import 'dart:async';

import 'package:danceteaching/components/status_pad_group.dart';
import 'package:danceteaching/utils/music_utils.dart';
import 'package:flutter/material.dart';

class StatusPadWidget extends StatefulWidget {
  final bool isStart;
  const StatusPadWidget({super.key, required this.isStart, required this.song});
  final int song;
  @override
  State<StatusPadWidget> createState() => _StatusPadWidgetState();
}

class _StatusPadWidgetState extends State<StatusPadWidget> {
  @override
  void initState() {
    super.initState();
    () async {
      debugPrint(statusPadperRhythm(widget.song, 0).toString());
      debugPrint(getWordperRhythm(widget.song, 0));
      await Future.delayed(
        Duration(milliseconds: getDurationperRhythm(widget.song, 0)),
      );
      for (int i = 1; i < allrhythmsong[widget.song] - 1; i++) {
        debugPrint(statusPadperRhythm(widget.song, i).toString());
        debugPrint(getWordperRhythm(widget.song, i));
        await Future.delayed(
          Duration(
            milliseconds:
                getDurationperRhythm(widget.song, i) -
                getDurationperRhythm(widget.song, i - 1),
          ),
        );
      }
    };
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isStart == false) {
      return StatusPadGroup(
        isActive: [false, false, false, false, false, false],
      );
    }
    return Placeholder();
  }
}
