import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/music_card.dart';
import 'package:danceteaching/components/videobox.dart';
import 'package:danceteaching/data/music.dart';
import 'package:danceteaching/services/music_provider.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicSelectedPage extends StatelessWidget {
  const MusicSelectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(context.read<MusicProvider>().musicnumber_selected.toString());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VideoBox(),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<MusicProvider>(
                        context,
                        listen: false,
                      ).deleteMusicSelect();
                      goBack(context);
                    },
                    child: GeneralText(data: 'กลับ'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (Provider.of<MusicProvider>(
                            context,
                            listen: false,
                          ).musicnumber_selected !=
                          null) {
                        goPage(context, RouteName.scoresummarypage);
                      }
                    },
                    child: GeneralText(data: 'เริ่ม'),
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
