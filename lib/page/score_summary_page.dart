import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/music_card.dart';
import 'package:danceteaching/components/navigation_util_widget.dart';
import 'package:danceteaching/components/summary_text.dart';
import 'package:danceteaching/data/music.dart';
import 'package:danceteaching/services/music_provider.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreSummary extends StatelessWidget {
  const ScoreSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SummaryText(data: "สรุป"),
              SizedBox(height: 40),
              SummaryText(data: "8/10"),
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
