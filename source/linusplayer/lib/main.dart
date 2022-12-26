import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linusplayer/views/base/bottom_navigartion_bar.dart';
import 'package:linusplayer/views/music_player/music_player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
          )),
      home: const BottomNavigation(),
    );
  }
}
