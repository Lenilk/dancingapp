import 'package:audioplayers/audioplayers.dart';
import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/music_card.dart';
import 'package:danceteaching/components/navigation_util_widget.dart';
import 'package:danceteaching/components/status_pad.dart';
import 'package:danceteaching/components/status_pad_group.dart';
import 'package:danceteaching/components/status_pad_widget.dart';
import 'package:danceteaching/components/videobox.dart';
import 'package:danceteaching/data/music.dart';
import 'package:danceteaching/services/music_provider.dart';
import 'package:danceteaching/utils/anto.dart';
import 'package:danceteaching/utils/music_utils.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicSelectedLandscapePage extends StatefulWidget {
  const MusicSelectedLandscapePage({super.key});

  @override
  State<MusicSelectedLandscapePage> createState() =>
      _MusicSelectedLandscapePageState();
}

class _MusicSelectedLandscapePageState
    extends State<MusicSelectedLandscapePage> {
  final player = AudioPlayer();
  PlayerState playerState = PlayerState.disposed;
  Future setSourcePlayer(int? musicnumber, double? range) async {
    debugPrint("Music Selected Page : $musicnumber , $range");
    await player.setReleaseMode(ReleaseMode.stop);
    await player.setPlaybackRate(range ?? 1);
    await player.setSource(
      AssetSource('audio/${music_file_list[musicnumber ?? 0]}.m4a'),
    );
    player.onPlayerStateChanged.listen((PlayerState s) {
      debugPrint('Current player state: $s');
      if (mounted) {
        setState(() {
          playerState = s;
          isclickedplay = false;
          if (s == PlayerState.playing) {
            isPlay = true;
          } else {
            isPlay = false;
          }
        });
      }
    });
  }

  int? musicnumber;
  double? dificultrange;
  @override
  void initState() {
    super.initState();
  }

  bool isPlay = false;
  @override
  void dispose() {
    player.release();
    player.dispose();
    super.dispose();
  }

  bool isclickedback = false;
  bool isclicked = false;
  bool isclickedplay = false;
  @override
  Widget build(BuildContext context) {
    musicnumber = context.read<MusicProvider>().musicnumber_selected;
    dificultrange = context.read<MusicProvider>().difficult_range;
    setSourcePlayer(musicnumber, dificultrange);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return Column(
                      children: [
                        if (musicnumber != null &&
                            musicnumber! < 3 &&
                            musicnumber! > -1)
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 90,
                              minWidth: 60,
                              maxHeight: 360,
                              maxWidth: 640,
                            ),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image(
                                image: AssetImage(
                                  "assets/picture/${music_file_list[musicnumber!]}.png",
                                ),
                              ),
                            ),
                          )
                        else
                          VideoBox(),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (musicnumber != null &&
                            musicnumber! < 3 &&
                            musicnumber! > -1)
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 90,
                                minWidth: 60,
                                maxHeight: 240,
                                maxWidth: 720,
                              ),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image(
                                  image: AssetImage(
                                    "assets/picture/${music_file_list[musicnumber!]}.png",
                                  ),
                                ),
                              ),
                            ),
                          )
                        else
                          VideoBox(),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  goBackButton(
                    () async {
                      if (!isclickedback) {
                        setState(() {
                          isclickedback = true;
                        });

                        debugPrint("Click");
                      } else {
                        return;
                      }
                      await writeStartStateToAnto(0);
                    },
                    "กลับ",
                    context,
                  ),
                  PlayerControllerButton(
                    player: player,
                    state: playerState,
                    fn: () {
                      setState(() {
                        isclickedplay = true;
                      });

                      debugPrint("Click");
                    },
                    isclicked: isclickedplay,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      debugPrint(player.state.toString());
                      if (player.state == PlayerState.completed) {
                        writeStartStateToAnto(0);

                        if (Provider.of<MusicProvider>(
                              context,
                              listen: false,
                            ).musicnumber_selected !=
                            null) {
                          goBack(context);
                          goPage(context, RouteName.scoresummarypage);
                        }
                      } else {
                        if (!isclicked) {
                          setState(() {
                            isclicked = true;
                          });
                          debugPrint("Click");
                        } else {
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "ไม่สามารถสรุปผลคะแนนได้ โปรดเล่นให้จบ",
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

// class MusicSelectedPage extends StatefulWidget {
//   const MusicSelectedPage({super.key});

//   @override
//   State<MusicSelectedPage> createState() => _MusicSelectedPageState();
// }

// class _MusicSelectedPageState extends State<MusicSelectedPage> {
//   final player = AudioPlayer();

//   bool finished = false;
//   PlayerState playerState = PlayerState.disposed;
//   Future setSourcePlayer(int? musicnumber, double? range) async {
//     debugPrint("Music Selected Page : $musicnumber , $range");
//     await player.setReleaseMode(ReleaseMode.stop);
//     await player.setPlaybackRate(range ?? 1);
//     await player.setSource(
//       AssetSource('audio/${music_file_list[musicnumber ?? 0]}.m4a'),
//     );
//     player.onPlayerStateChanged.listen((PlayerState s) {
//       debugPrint('Current player state: $s');
//       if (mounted) {
//         setState(() {
//           setState(() {
//             playerState = s;
//             isclickedplay = false;
//           });
//         });
//       }
//     });
//   }

//   int? musicnumber;
//   double? dificultrange;
//   @override
//   void initState() {
//     super.initState();
//   }

//   bool isPlay = false;
//   @override
//   void dispose() {
//     player.release();
//     player.dispose();
//     super.dispose();
//   }

//   bool isclickedplay = false;

//   bool isclickedback = false;
//   bool isclicked = false;
//   @override
//   Widget build(BuildContext context) {
//     musicnumber = context.read<MusicProvider>().musicnumber_selected;
//     dificultrange = context.read<MusicProvider>().difficult_range;
//     setSourcePlayer(musicnumber, dificultrange);
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (musicnumber != null && musicnumber! < 3 && musicnumber! > -1)
//                 Flexible(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minHeight: 90,
//                       minWidth: 60,
//                       maxHeight: 360,
//                       maxWidth: 640,
//                     ),
//                     child: AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: Image(
//                         image: AssetImage(
//                           "assets/picture/${music_file_list[musicnumber!]}.png",
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               else
//                 VideoBox(),
//               SizedBox(height: 40),
//               StatusPadGroup(
//                 isActive: [false, false, false, false, false, false],
//               ),
//               SizedBox(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   goBackButton(
//                     () async {
//                       if (!isclickedback) {
//                         setState(() {
//                           isclickedback = true;
//                         });

//                         debugPrint("Click");
//                       } else {
//                         return;
//                       }
//                       await writeStartStateToAnto(0);
//                     },
//                     "กลับ",
//                     context,
//                   ),
//                   PlayerControllerButton(
//                     player: player,
//                     state: playerState,
//                     fn: () {
//                       setState(() {
//                         isclickedplay = true;
//                       });

//                       debugPrint("Click");
//                     },
//                     isclicked: isclickedplay,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       debugPrint(player.state.toString());
//                       if (player.state == PlayerState.completed) {
//                         writeStartStateToAnto(0);

//                         if (Provider.of<MusicProvider>(
//                               context,
//                               listen: false,
//                             ).musicnumber_selected !=
//                             null) {
//                           goBack(context);
//                           goPage(context, RouteName.scoresummarypage);
//                         }
//                       } else {
//                         if (!isclicked) {
//                           setState(() {
//                             isclicked = true;
//                           });
//                           debugPrint("Click");
//                         } else {
//                           return;
//                         }
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                               "ไม่สามารถสรุปผลคะแนนได้ โปรดเล่นให้จบ",
//                               style: TextStyle(
//                                 fontSize: 26,
//                                 color: Theme.of(context).primaryColor,
//                                 fontWeight: FontWeight.w200,
//                               ),
//                             ),
//                             duration: Duration(seconds: 2),
//                             backgroundColor: Colors.blue[100],
//                           ),
//                         );
//                       }
//                     },
//                     child: GeneralText(data: 'สรุป'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class PlayerControllerButton extends StatefulWidget {
  final AudioPlayer player;
  final PlayerState state;
  final Function fn;
  final bool isclicked;
  const PlayerControllerButton({
    super.key,
    required this.player,
    required this.state,
    required this.fn,
    required this.isclicked,
  });

  @override
  State<PlayerControllerButton> createState() => _PlayerControllerButtonState();
}

class _PlayerControllerButtonState extends State<PlayerControllerButton> {
  PlayerState? oldState;
  @override
  Widget build(BuildContext context) {
    AudioPlayer player = widget.player;
    return ElevatedButton(
      onPressed: () async {
        if (!widget.isclicked) {
          widget.fn();
          if (widget.state == PlayerState.playing) {
            await writeStartStateToAnto(0);
            await player.stop();
          } else {
            await writeStartStateToAnto(1);
            //await Future.delayed(Duration(seconds: 1, milliseconds: 750));
            await player.resume();
          }
        }
      },
      child: widget.state == PlayerState.playing
          ? GeneralText(data: 'เริ่มใหม่')
          : GeneralText(data: 'เริ่ม'),
    );
  }
}

// class MusicSelectedRootPage extends StatefulWidget {
//   const MusicSelectedRootPage({super.key});

//   @override
//   State<MusicSelectedRootPage> createState() => _MusicSelectedRootPageState();
// }

// class _MusicSelectedRootPageState extends State<MusicSelectedRootPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MusicSelectedLandscapePage();
//   }
// }
