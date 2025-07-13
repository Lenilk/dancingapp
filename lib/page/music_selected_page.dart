import 'package:audioplayers/audioplayers.dart';
import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/music_card.dart';
import 'package:danceteaching/components/videobox.dart';
import 'package:danceteaching/data/music.dart';
import 'package:danceteaching/services/music_provider.dart';
import 'package:danceteaching/utils/music_utils.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicSelectedPage extends StatefulWidget {
  const MusicSelectedPage({super.key});

  @override
  State<MusicSelectedPage> createState() => _MusicSelectedPageState();
}

class _MusicSelectedPageState extends State<MusicSelectedPage> {
  final player = AudioPlayer();
  PlayerState playerState = PlayerState.disposed;
  Future setSourcePlayer(int? musicnumber) async {
    await player.setReleaseMode(ReleaseMode.stop);
    await player.setPlaybackRate(1.00);
    await player.setSource(
      AssetSource('audio/${music_file_list[musicnumber ?? 0]}.m4a'),
    );
    player.onPlayerStateChanged.listen((PlayerState s) {
      debugPrint('Current player state: $s');
      if (mounted) {
        setState(() => playerState = s);
      }
    });
  }

  bool isPlay = false;
  @override
  void dispose() {
    player.release();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? musicnumber = context.read<MusicProvider>().musicnumber_selected;
    setSourcePlayer(musicnumber);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (musicnumber != null && musicnumber < 3 && musicnumber > -1)
                Flexible(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 90,
                      minWidth: 60,
                      maxHeight: 360,
                      maxWidth: 720,
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image(
                        image: AssetImage(
                          "assets/picture/${music_file_list[musicnumber]}.png",
                        ),
                      ),
                    ),
                  ),
                )
              else
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
                  PlayerControllerButton(player: player, state: playerState),
                  ElevatedButton(
                    onPressed: () {
                      if (Provider.of<MusicProvider>(
                            context,
                            listen: false,
                          ).musicnumber_selected !=
                          null) {
                        goBack(context);
                        goPage(context, RouteName.scoresummarypage);
                      }
                    },
                    child: GeneralText(data: 'สรุป'),
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

class PlayerControllerButton extends StatefulWidget {
  final AudioPlayer player;
  final PlayerState state;
  const PlayerControllerButton({
    super.key,
    required this.player,
    required this.state,
  });

  @override
  State<PlayerControllerButton> createState() => _PlayerControllerButtonState();
}

class _PlayerControllerButtonState extends State<PlayerControllerButton> {
  @override
  Widget build(BuildContext context) {
    AudioPlayer player = widget.player;
    return ElevatedButton(
      onPressed: () async {
        if (widget.state == PlayerState.playing) {
          await player.stop();
        } else {
          await player.resume();
        }
      },
      child: widget.state == PlayerState.playing
          ? GeneralText(data: 'เริ่มใหม่')
          : GeneralText(data: 'เริ่ม'),
    );
  }
}
