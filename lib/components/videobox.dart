import 'package:flutter/material.dart';

class VideoBox extends StatelessWidget {
  const VideoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 90,
        minWidth: 160,
        maxHeight: 180,
        maxWidth: 320,
      ),
      child: Placeholder(),
    );
  }
}
