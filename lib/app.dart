import 'package:flutter/material.dart';
import 'package:danceteaching/page/home_page.dart';
import 'package:danceteaching/utils/navitor_utils.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dancing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: route,
      home: const HomePage(),
    );
  }
}
