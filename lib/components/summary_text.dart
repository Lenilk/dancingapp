import 'package:flutter/material.dart';

class SummaryText extends StatelessWidget {
  final String data;
  const SummaryText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.clip,
      style: TextStyle(fontSize: 36),
    );
  }
}
