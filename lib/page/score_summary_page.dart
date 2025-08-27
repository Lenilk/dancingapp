import 'dart:convert';

import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/music_card.dart';
import 'package:danceteaching/components/navigation_util_widget.dart';
import 'package:danceteaching/components/summary_text.dart';
import 'package:danceteaching/data/music.dart';
import 'package:danceteaching/services/music_provider.dart';
import 'package:danceteaching/utils/anto.dart';
import 'package:danceteaching/utils/anto.key.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ScoreSummary extends StatefulWidget {
  const ScoreSummary({super.key});

  @override
  State<ScoreSummary> createState() => _ScoreSummaryState();
}

class _ScoreSummaryState extends State<ScoreSummary> {
  final thishttp = http.Client();
  int score = 0;
  String state = "wait";
  String value = "";
  Future fetchScore() async {
    try {
      final res = await thishttp.get(
        Uri.parse("https://api.anto.io/channel/get/$antokey/Relay/score"),
      );
      if (res.statusCode == 200) {
        setState(() {
          value = (jsonDecode(res.body) as Map<String, dynamic>)["value"];
          score = int.parse(value);
          state = "success";
          debugPrint(state);
        });
      } else {
        setState(() {
          state = "fail";
        });
        debugPrint(state);
      }
    } catch (e) {
      setState(() {
        state = "fail";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state == "wait")
                SummaryText(data: "รอสักครู่..")
              else if (state == "success")
                Column(
                  children: [
                    SummaryText(data: "สรุป"),
                    SizedBox(height: 40),
                    SummaryText(data: "$score/10"),
                  ],
                )
              else if (state == "fail")
                SummaryText(data: "มีข้อผิดพลาด"),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  goBackButton(null, "กลับ", context),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MusicProvider>().deleteMusicSelect();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.homepage.toString(),
                        (route) => false,
                      );
                    },
                    child: GeneralText(data: 'เมนู'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
