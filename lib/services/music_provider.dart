import 'package:danceteaching/data/music.dart';
import 'package:flutter/foundation.dart';

class MusicProvider extends ChangeNotifier {
  int? musicnumber_selected = null;
  int? get musicnumber_selecting => musicnumber_selected;
  String? music_selected = null;
  String? get music_selecting => music_selected;
  int? music_difficult_number_selected = null;
  int? get music_difficult_number_selecting => music_difficult_number_selected;
  double? difficult_range = null;
  double? get difficult_range_selecting => difficult_range;
  void select(int musicnum) {
    debugPrint(musicnum.toString());
    musicnumber_selected = musicnum;
    music_selected = music_name[musicnum];
    notifyListeners();
  }

  void selectDifficult(int difficultnum) {
    debugPrint(difficultnum.toString());
    music_difficult_number_selected = difficultnum;
    if (difficultnum != 3) {
      difficult_range = difficult_music[difficultnum];
    }
  }

  void setDifficultRange(double range) {
    debugPrint("difficult range: $range");
    difficult_range = range;
  }

  void deletedifficultSelect() {
    music_difficult_number_selected = null;
    difficult_range = null;
  }

  void deleteMusicSelect() {
    musicnumber_selected = null;
    music_selected = null;
    notifyListeners();
  }
}
