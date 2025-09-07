import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/navigation_util_widget.dart';
import 'package:danceteaching/components/pad_button_group.dart';
import 'package:danceteaching/components/status_pad_group.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';
import 'package:danceteaching/components/status_pad.dart';

class TestBeforePlayPage extends StatefulWidget {
  const TestBeforePlayPage({super.key});

  @override
  State<TestBeforePlayPage> createState() => _TestBeforePlayPageState();
}

class _TestBeforePlayPageState extends State<TestBeforePlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PadButtonGroup(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [SizedBox(), goBackButton(null, "กลับ", context)],
            ),
          ],
        ),
      ),
    );
  }
}
