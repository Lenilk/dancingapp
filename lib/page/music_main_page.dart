import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/music_card.dart';
import 'package:danceteaching/components/navigation_util_widget.dart';
import 'package:danceteaching/data/music.dart';
import 'package:danceteaching/services/music_provider.dart';
import 'package:danceteaching/utils/anto.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicMainPage extends StatefulWidget {
  const MusicMainPage({super.key});

  @override
  State<MusicMainPage> createState() => _MusicMainPageState();
}

class _MusicMainPageState extends State<MusicMainPage> {
  bool isclicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GeneralText(data: "เพลง"),
              SizedBox(height: 40),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 250,
                  maxWidth: 350,
                  maxHeight:
                      MediaQuery.sizeOf(context).height <
                          MediaQuery.sizeOf(context).width
                      ? MediaQuery.sizeOf(context).height - 200
                      : double.infinity,
                ),
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MusicCard(
                      name: music_name[index],
                      index: index,
                      fn: () {
                        setState(() {
                          isclicked = false;
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  goBackButton(
                    () => Provider.of<MusicProvider>(
                      context,
                      listen: false,
                    ).deleteMusicSelect(),
                    "กลับ",
                    context,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      int? selected_music = Provider.of<MusicProvider>(
                        context,
                        listen: false,
                      ).musicnumber_selected;
                      if (selected_music != null) {
                        writeSongStateToAnto(selected_music + 1);
                        goPage(context, RouteName.difficultselectpage);
                      } else {
                        if (!isclicked) {
                          isclicked = true;
                          debugPrint("Click");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "โปรดเลือกเพลง",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.blue[100],
                            ),
                          );
                        } else {
                          return;
                        }
                      }
                    },
                    child: GeneralText(data: 'ระดับความเร็ว'),
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
