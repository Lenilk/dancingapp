import 'dart:async';

import 'package:danceteaching/components/pad_button.dart';
import 'package:danceteaching/utils/anto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PadButtonGroup extends StatefulWidget {
  const PadButtonGroup({super.key});

  @override
  State<PadButtonGroup> createState() => _PadButtonGroupState();
}

class _PadButtonGroupState extends State<PadButtonGroup> {
  final readhttp = http.Client();
  // final writehttp = http.Client();
  List<String> value = ["0", "0", "0", "0", "0", "0"];

  Future fetchAll() async {
    if (mounted == false) {
      return;
    }
    await Future.wait([
          readRelayStateFromAnto(readhttp, "sw1"),
          readRelayStateFromAnto(readhttp, "sw2"),
          readRelayStateFromAnto(readhttp, "sw3"),
          readRelayStateFromAnto(readhttp, "sw4"),
          readRelayStateFromAnto(readhttp, "sw5"),
          readRelayStateFromAnto(readhttp, "sw6"),
        ])
        .then(
          (val) => {
            if (mounted)
              {
                setState(() {
                  value = val;
                }),
              },
          },
        )
        .whenComplete(() {
          debugPrint(value.toString());
          if (mounted) {
            setState(() {});
          }
          debugPrint("Fetch api");
        });
  }

  Future writeAndUpdateDataWhenPushButton(String sw, int num) async {
    debugPrint("Click");
    await writeRelayDataToAnto(readhttp, sw, SwitchRelay(value[num]));
    String val = await readRelayStateFromAnto(readhttp, sw);
    setState(() {
      value[num] = val;
    });
    debugPrint(value.toString());
  }

  @override
  void initState() {
    super.initState();
    fetchAll();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String SwitchRelay(String a) {
    return (int.parse(a) == 1 ? 0 : 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              padButton(
                () => writeAndUpdateDataWhenPushButton("sw1", 0),
                value[0] == "1" ? Colors.red : Colors.blueGrey,
              ),
              padButton(
                () => writeAndUpdateDataWhenPushButton("sw2", 1),
                value[1] == "1" ? Colors.green : Colors.blueGrey,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [padButton(() {}, Colors.grey)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              halfPadButton(
                () => writeAndUpdateDataWhenPushButton("sw3", 2),
                value[2] == "1" ? Colors.lightGreen : Colors.blueGrey,
              ),
              halfPadButton(
                () => writeAndUpdateDataWhenPushButton("sw4", 3),
                value[3] == "1" ? Colors.brown : Colors.blueGrey,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              halfPadButton(
                () => writeAndUpdateDataWhenPushButton("sw5", 4),
                value[4] == "1" ? Colors.green : Colors.grey,
              ),
              halfPadButton(
                () => writeAndUpdateDataWhenPushButton("sw6", 5),
                value[5] == "1" ? Colors.red : Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
