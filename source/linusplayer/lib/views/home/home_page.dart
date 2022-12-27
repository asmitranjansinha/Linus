import 'package:flutter/material.dart';
import 'package:linusplayer/views/base/bottom_music_container.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void requestPermission() async {
    await Permission.storage.request();
    setState(() {});
  }

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomMusicContainer(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        )));
  }
}
