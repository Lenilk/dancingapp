import 'package:danceteaching/page/difficult_select_page.dart';
import 'package:danceteaching/page/score_summary_page.dart';
import 'package:danceteaching/page/test_before_play_page.dart';
import 'package:flutter/material.dart';
import 'package:danceteaching/page/page.dart';

void goBack(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}

void goPage(BuildContext context, RouteName name) {
  Navigator.pushNamed(context, name.toString());
}

enum RouteName {
  homepage,
  musicselectedpage,
  musicmainpage,
  tutorialpage,
  scoresummarypage,
  testbeforeplaypage,
  difficultselectpage,
}

Map<String, Widget Function(BuildContext)> route = {
  RouteName.homepage.toString(): (context) => HomePage(),
  RouteName.musicselectedpage.toString(): (context) => MusicSelectedRootPage(),
  RouteName.musicmainpage.toString(): (context) => MusicMainPage(),
  RouteName.tutorialpage.toString(): (context) => TutorialPage(),
  RouteName.scoresummarypage.toString(): (context) => ScoreSummary(),
  RouteName.testbeforeplaypage.toString(): (context) => TestBeforePlayPage(),
  RouteName.difficultselectpage.toString(): (context) => DifficultSelectPage(),
};
