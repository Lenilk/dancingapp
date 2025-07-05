import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/components/videobox.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VideoBox(),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      goPage(context, RouteName.tutorialpage);
                    },
                    child: GeneralText(data: "วิธีเล่น"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      goPage(context, RouteName.musicmainpage);
                    },
                    child: GeneralText(data: "เลือกเพลง"),
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
