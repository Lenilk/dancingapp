import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/navigation_util_widget.dart';
import 'package:danceteaching/data/music.dart';
import 'package:danceteaching/services/music_provider.dart';
import 'package:danceteaching/utils/anto.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DifficultSelectPage extends StatefulWidget {
  const DifficultSelectPage({super.key});

  @override
  State<DifficultSelectPage> createState() => _DifficultSelectPageState();
}

class _DifficultSelectPageState extends State<DifficultSelectPage> {
  int? difficult = null;
  double range = 1;
  Widget difficultButton(VoidCallback fn, String text, int index) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          difficult == index ? Colors.blue[200] : null,
        ),
      ),
      onPressed: () {
        fn();
        setState(() {
          difficult = index;
        });
      },
      child: GeneralText(data: text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              difficultButton(() {}, "ปกติ", 0),
              difficultButton(() {}, "ยาก", 1),
              difficultButton(() {}, "เลือกเอง", 2),
              if (difficult == 2)
                Column(
                  children: [
                    Text("${range.toStringAsFixed(2)}x"),
                    SizedBox(
                      width: 300,
                      child: Slider(
                        divisions: 6,
                        min: 0.7,
                        max: 1.3,
                        value: range,
                        onChanged: (value) {
                          setState(() {
                            range = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  goBackButton(
                    () => Provider.of<MusicProvider>(
                      context,
                      listen: false,
                    ).deletedifficultSelect(),
                    "กลับ",
                    context,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (difficult != null) {
                        context.read<MusicProvider>().selectDifficult(
                          difficult ?? 1,
                        );

                        if (difficult == 2) {
                          context.read<MusicProvider>().setDifficultRange(
                            range,
                          );
                        }
                        if (difficult != 2) {
                          await writeSpeedStateToAnto(
                            difficult_music[difficult ?? 1],
                          );
                        } else {
                          await writeSpeedStateToAnto(range);
                        }

                        goPage(context, RouteName.musicselectedpage);
                      }
                    },
                    child: GeneralText(data: 'เล่น'),
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
