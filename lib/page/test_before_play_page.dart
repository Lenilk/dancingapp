import 'package:danceteaching/components/general_text.dart';
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
            LayoutBuilder(
              builder: (context, BoxConstraints size) {
                if (MediaQuery.of(context).size.height >
                    MediaQuery.of(context).size.width) {
                  return Column(
                    children: [
                      StatusPadGroup(
                        isActive: [false, false, false, false, false, false],
                      ),
                      SizedBox(height: 40),

                      PadButtonGroup(),
                      SizedBox(height: 10),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StatusPadGroup(
                            isActive: [
                              false,
                              false,
                              false,
                              false,
                              false,
                              false,
                            ],
                          ),
                          SizedBox(width: 40),
                          PadButtonGroup(),
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: GeneralText(data: "เมณู"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
