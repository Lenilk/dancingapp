import 'package:danceteaching/data/music.dart';
import 'package:flutter/foundation.dart';

class MusicProvider extends ChangeNotifier {
  int? musicnumber_selected = null;
  int? get musicnumber_selecting => musicnumber_selected;
  String? music_selected = null;
  String? get music_selecting => music_selected;

  void select(int musicnum) {
    debugPrint(musicnum.toString());
    musicnumber_selected = musicnum;
    music_selected = music_name[musicnum];
    notifyListeners();
  }

  void deleteMusicSelect() {
    musicnumber_selected = null;
    music_selected = null;
    notifyListeners();
  }
}
