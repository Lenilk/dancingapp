import 'package:danceteaching/services/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:danceteaching/app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MusicProvider())],
      child: App(),
    ),
  );
}
