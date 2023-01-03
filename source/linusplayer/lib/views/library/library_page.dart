import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linusplayer/views/base/mini_player.dart';
import 'package:linusplayer/views/base/text_container.dart';
import 'package:linusplayer/views/library/all_songs_page.dart';
import 'package:permission_handler/permission_handler.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
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
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Library",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              TextContainer(
                textData: "All Songs",
                onTap: () {
                  Get.to(() => AllSongsPage(),
                      transition: Transition.cupertinoDialog);
                },
              )
            ],
          ),
        )));
  }
}
