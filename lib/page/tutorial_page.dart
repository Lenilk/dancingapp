import 'package:danceteaching/components/videobox.dart';
import 'package:flutter/material.dart';
import 'package:danceteaching/components/general_text.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: VideoBox()),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: GeneralText(data: "เมณู"),
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
