import 'dart:io';

import 'package:danceteaching/components/videobox.dart';
import 'package:flutter/material.dart';
import 'package:danceteaching/components/general_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      _controller = VideoPlayerController.asset('assets/video/tutorial.mp4');

      _controller.addListener(() {
        setState(() {});
      });

      _controller.initialize().then((_) => setState(() {}));
      _controller.setVolume(1);
      _controller.play();
    }
  }

  @override
  void dispose() {
    if (Platform.isAndroid) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Platform.isAndroid)
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 90,
                      minWidth: 160,
                      maxHeight: 360,
                      maxWidth: 480,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              else
                InkWell(
                  child: Text(
                    'https://youtu.be/fUQ77yhtOnE',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () async {
                    final Uri _url = Uri.parse('https://youtu.be/fUQ77yhtOnE');
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: GeneralText(data: "เมนู"),
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
