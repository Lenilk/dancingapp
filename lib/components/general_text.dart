import 'package:flutter/material.dart';

class GeneralText extends StatelessWidget {
  final String data;
  const GeneralText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.clip,
      style: TextStyle(fontSize: 22),
    );
  }
}
